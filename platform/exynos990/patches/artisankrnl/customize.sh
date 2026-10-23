# [
EXTREMEKRNL_REPO="https://github.com/Android-Artisan/android_kernel_samsung_exynos990"

BUILD_KERNEL()
{
    local PARENT=$(pwd)
    
    # Ensure we are in the correct directory
    cd "$KERNEL_TMP_DIR" || ABORT "BUILD_KERNEL: Cannot find $KERNEL_TMP_DIR"

    LOG "- Running build for ${TARGET_CODENAME}"
    EVAL "./build.sh -m ${TARGET_CODENAME} -k y -r n"

    # Fixup for LTE devices
    LOG "- Running build for ${TARGET_CODENAME}lte"
    EVAL "./build.sh -m ${TARGET_CODENAME}lte -k n -r n -d y"

    cd "$PARENT"
}

SAFE_PULL_CHANGES()
{
    set -eo pipefail
    local PARENT=$(pwd)

    cd "$KERNEL_TMP_DIR" || ABORT "SAFE_PULL: Directory missing"
    EVAL "git fetch origin"

    LOCAL=$(git rev-parse @)
    REMOTE=$(git rev-parse origin/main)
    BASE=$(git merge-base @ origin/main)

    if [[ "$LOCAL" == "$REMOTE" ]]; then
        LOG "- Local branch is up-to-date."
    elif [[ "$LOCAL" == "$BASE" ]]; then
        LOG "- Fast-forwarding."
        EVAL "git pull --ff-only"
    else
        LOGW "- Local branch diverged or ahead. Resetting to remote."
        git reset --hard origin/main
    fi

    cd "$PARENT"
}

APPLY_PATCH_ONCE()
{
    local REPO="$1" PATCH="$2" LABEL="$3"

    [[ -f "$PATCH" ]] || ABORT "$LABEL: patch missing at $PATCH"

    if git -C "$REPO" apply --check "$PATCH" >/dev/null 2>&1; then
        LOG "- Applying $LABEL"
        git -C "$REPO" apply "$PATCH" || ABORT "$LABEL: git apply failed"
    elif git -C "$REPO" apply --reverse --check "$PATCH" >/dev/null 2>&1; then
        LOG "- $LABEL already applied"
    else
        ABORT "$LABEL: does not apply to $REPO"
    fi
}

APPLY_SEPOLICY_FIX()
{
    local PATCH_DIR="$(pwd)/platform/exynos990/patches/artisankrnl"

    # KernelSU-Next is an external submodule, so its half of the fix (the
    # policy_rwlock write-side deadlock and the skipped AVC cache flush) lives
    # in the ROM tree and is re-applied every build: `git reset --hard
    # FETCH_HEAD` on the superproject does not touch the submodule working
    # tree. The kernel-side half (security/selinux) is committed to the kernel
    # source itself, so it needs no patch here.
    APPLY_PATCH_ONCE "$KERNEL_TMP_DIR/KernelSU-Next" "$PATCH_DIR/kernelsu-sepolicy-fix.patch" "kernelsu-sepolicy-fix.patch"
    # FBE (software crypto): f2fs_submit_page_write dereferenced bio_page->mapping, which is NULL for fscrypt bounce pages
    APPLY_PATCH_ONCE "$KERNEL_TMP_DIR"               "$PATCH_DIR/f2fs-bounce-page-inode.patch" "f2fs-bounce-page-inode.patch"
    # Adoptable storage: Android vold always passes "allow_encrypt_override" to dm-crypt
    APPLY_PATCH_ONCE "$KERNEL_TMP_DIR"               "$PATCH_DIR/dm-crypt-allow-encrypt-override.patch" "dm-crypt-allow-encrypt-override.patch"
    # Battery protection (One UI 6.1+): batt_soc_rechg + full capacity events, port of Samsung sb_full_soc (S24)
    APPLY_PATCH_ONCE "$KERNEL_TMP_DIR"               "$PATCH_DIR/battery-eu-eco-rechg.patch" "battery-eu-eco-rechg.patch"
    # Hi Bixby / Hey Google: keep the VTS voice trigger backlog (ALSA hw_params would clear it)
    APPLY_PATCH_ONCE "$KERNEL_TMP_DIR"               "$PATCH_DIR/vts-keep-trigger-backlog.patch" "vts-keep-trigger-backlog.patch"
}

STAMP_KERNEL_VERSION()
{
    # MasterROM: adds "-mr<kernel commits>.<patch_rev>" to the kernel version
    # ("4.19.87-ArtisanKRNL-v4.0.1-mr812.1"). The ROM build and the kernel-only build
    # (.github/workflows/kernel.yml) both run this, so the same source gives the same
    # version and the updater only offers a kernel that really is newer.
    # Raise the number in patch_rev whenever the patches in this folder change.
    local DEFCONFIG="$KERNEL_TMP_DIR/arch/arm64/configs/exynos9830_defconfig"
    local REV PATCH_REV
    # commits since ArtisanKRNL last changed its version (small numbers, restarts with every new vX.Y.Z)
    local BUMP
    BUMP="$(git -C "$KERNEL_TMP_DIR" log -1 --format=%H -G"^CONFIG_LOCALVERSION=" -- arch/arm64/configs/exynos9830_defconfig)"
    REV="$(git -C "$KERNEL_TMP_DIR" rev-list --count ${BUMP:+$BUMP..}HEAD)"
    PATCH_REV="$(tr -d '[:space:]' < "$(pwd)/platform/exynos990/patches/artisankrnl/patch_rev" 2>/dev/null)"
    [[ -n "$PATCH_REV" ]] || PATCH_REV=1
    sed -i -E "s/^(CONFIG_LOCALVERSION=\"[^\"]*-v[0-9.]+)[^\"]*\"/\1-mr${REV}.${PATCH_REV}\"/" "$DEFCONFIG"
    LOG "- Kernel version: $(grep '^CONFIG_LOCALVERSION=' "$DEFCONFIG")"
}

REPLACE_KERNEL_BINARIES()
{
    # 1. Define the directory name based on your requirement
    # Using 'out' as the parent folder
    KERNEL_TMP_DIR="out/kernel_tmp-${TARGET_PLATFORM}"

    # 2. Check if the directory is missing
    if [[ ! -d "$KERNEL_TMP_DIR" ]]; then
        LOG "- Kernel directory missing. Cloning into $KERNEL_TMP_DIR..."
        # Ensure 'out' exists before cloning
        mkdir -p -- "out"
        EVAL "git clone --branch bpf111 --single-branch --recurse-submodules \"$EXTREMEKRNL_REPO\" \"$KERNEL_TMP_DIR\"" || ABORT "Clone failed"
    fi

    # 3. Repository Sync
    if [[ -d "$KERNEL_TMP_DIR/.git" ]]; then
        cd "$KERNEL_TMP_DIR" || exit
        LOG "- Syncing source code..."
        git fetch --all
        git reset --hard FETCH_HEAD
        cd - > /dev/null || exit
    else
        ABORT "Directory exists but is not a git repo: $KERNEL_TMP_DIR"
    fi

    # 4. Apply the selinux/KSU fixes (must run after the reset above)
    APPLY_SEPOLICY_FIX
    STAMP_KERNEL_VERSION

    # 5. Execute Build
    LOG "- Starting kernel build process."
    BUILD_KERNEL

    # 6. Artifact Management
    [[ ! -d "$WORK_DIR/kernel" ]] && mkdir -p -- "$WORK_DIR/kernel"

    for i in "boot" "dtbo"; do
        local SRC="$KERNEL_TMP_DIR/build/out/$TARGET_CODENAME/$i.img"
        if [[ -f "$SRC" ]]; then
            rm -f "$WORK_DIR/kernel/$i.img"
            mv -f "$SRC" "$WORK_DIR/kernel/$i.img"
        else
            LOGW "Artifact $i.img not found at $SRC"
        fi
    done

    # LTE Artifacts
    if [[ "$TARGET_CODENAME" != "r8s" ]] && [[ "$TARGET_CODENAME" != "z3s" ]]; then
        local LTE_SRC="$KERNEL_TMP_DIR/build/out/${TARGET_CODENAME}lte/dtbo.img"
        if [[ -f "$LTE_SRC" ]]; then
            mv -f "$LTE_SRC" "$WORK_DIR/kernel/dtbo_lte.img"
        fi
    fi
}
# ]

REPLACE_KERNEL_BINARIES
