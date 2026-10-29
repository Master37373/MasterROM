# [
EXTREMEKRNL_REPO="https://github.com/Android-Artisan/android_kernel_samsung_exynos990"
# KernelSU-Next driver (legacy branch, for non-GKI 4.19 with manual hooks). ArtisanKRNL pins an
# older commit as a submodule; MasterROM moves it to this one. Raise patch_rev when changing it.
KSUN_REPO="https://github.com/KernelSU-Next/KernelSU-Next"
KSUN_COMMIT="b933b1f728116a456fbebf27b6a8772a640cdf23"

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

    # SuSFS: ArtisanKRNL carries the kernel half of SuSFS v2.2.0 (fs/susfs.c and the fs/ hooks), but
    # KernelSU-Next legacy has no SuSFS support, so CONFIG_KSU_SUSFS had no Kconfig entry and was
    # dropped. This adds the KernelSU half: Kconfig, ksu_susfs tool commands, SIDs, umounted-app marking.
    APPLY_PATCH_ONCE "$KERNEL_TMP_DIR/KernelSU-Next" "$PATCH_DIR/kernelsu-susfs.patch" "kernelsu-susfs.patch"
    # SuSFS fixes from upstream susfs4ksu (v2.3.x) for the in-tree v2.2.0: kstat ctime flag and is_statically
    # type (ABI of the current ksu_susfs tool), NULL deref, leaks, SRCU/seqlock and use-after-dput fixes
    APPLY_PATCH_ONCE "$KERNEL_TMP_DIR"               "$PATCH_DIR/susfs-fixes.patch" "susfs-fixes.patch"
    # FBE (software crypto): f2fs_submit_page_write dereferenced bio_page->mapping, which is NULL for fscrypt bounce pages
    APPLY_PATCH_ONCE "$KERNEL_TMP_DIR"               "$PATCH_DIR/f2fs-bounce-page-inode.patch" "f2fs-bounce-page-inode.patch"
    # Adoptable storage: Android vold always passes "allow_encrypt_override" to dm-crypt
    APPLY_PATCH_ONCE "$KERNEL_TMP_DIR"               "$PATCH_DIR/dm-crypt-allow-encrypt-override.patch" "dm-crypt-allow-encrypt-override.patch"
    # Battery protection (One UI 6.1+): batt_soc_rechg + full capacity events, port of Samsung sb_full_soc (S24)
    APPLY_PATCH_ONCE "$KERNEL_TMP_DIR"               "$PATCH_DIR/battery-eu-eco-rechg.patch" "battery-eu-eco-rechg.patch"
    # Hi Bixby / Hey Google: keep the VTS voice trigger backlog (ALSA hw_params would clear it)
    APPLY_PATCH_ONCE "$KERNEL_TMP_DIR"               "$PATCH_DIR/vts-keep-trigger-backlog.patch" "vts-keep-trigger-backlog.patch"
}

UPDATE_KSUN()
{
    # The policy_rwlock fix MasterROM used to carry as kernelsu-sepolicy-fix.patch is part of
    # KernelSU-Next legacy since 465490a2, so no KSU patch is needed any more.
    # Full history is needed: KernelSU-Next derives its version (manager check) from the commit count.
    local K="$KERNEL_TMP_DIR/KernelSU-Next"
    if [[ "$(git -C "$K" rev-parse HEAD 2>/dev/null)" != "$KSUN_COMMIT" ]]; then
        LOG "- Updating KernelSU-Next to ${KSUN_COMMIT:0:12}"
        git -C "$K" reset -q --hard
        git -C "$K" clean -qfd
        [[ -f "$K/.git/shallow" ]] && git -C "$K" fetch -q --unshallow "$KSUN_REPO"
        git -C "$K" fetch -q --tags "$KSUN_REPO" "$KSUN_COMMIT" || ABORT "KernelSU-Next: fetch failed"
        git -C "$K" checkout -q --detach "$KSUN_COMMIT" || ABORT "KernelSU-Next: checkout failed"
    fi
    LOG "- KernelSU-Next: $(git -C "$K" describe --tags 2>/dev/null) ($(git -C "$K" rev-list --count HEAD) commits)"
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

    # 4. KernelSU-Next driver update, then the MasterROM fixes (must run after the reset above)
    UPDATE_KSUN
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
