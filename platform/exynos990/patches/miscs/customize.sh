LOG_STEP_IN "- Setting casefold props"
SET_PROP "vendor" "external_storage.projid.enabled" "1"
SET_PROP "vendor" "external_storage.casefold.enabled" "1"
SET_PROP "vendor" "external_storage.sdcardfs.enabled" "0"
SET_PROP "vendor" "persist.sys.fuse.passthrough.enable" "true"
LOG_STEP_OUT

LOG_STEP_IN "- Enabling IncrementalFS"
SET_PROP "vendor" "ro.incremental.enable" "yes"
LOG_STEP_OUT

LOG_STEP_IN "- Enabling FS Verity"
SET_PROP "vendor" "ro.apk_verity.mode" "2"
LOG_STEP_OUT

if [[ "$SOURCE_PLATFORM_SDK_VERSION" -ge 36 ]]; then
    LOG_STEP_IN "- Updating Codec2 seccomp policy"
    CODEC2_POLICY="$WORK_DIR/vendor/etc/seccomp_policy/samsung.software.media.c2-base-policy"
    CODEC2_OLD_RULE="mremap: arg3 == 3"
    CODEC2_NEW_RULE="mremap: arg3 == 3 || arg3 == MREMAP_MAYMOVE"

    if [ ! -f "$CODEC2_POLICY" ]; then
        LOG "  - Codec2 seccomp policy is not present; skipping"
    else
        if grep -q -F -x "$CODEC2_NEW_RULE" "$CODEC2_POLICY"; then
            LOG "  - MREMAP_MAYMOVE is already allowed"
        elif grep -q -F -x "$CODEC2_OLD_RULE" "$CODEC2_POLICY"; then
            LOG "  - Allowing MREMAP_MAYMOVE in ${CODEC2_POLICY//$WORK_DIR\//}"
            EVAL "sed -i 's/^mremap: arg3 == 3$/mremap: arg3 == 3 || arg3 == MREMAP_MAYMOVE/' \"$CODEC2_POLICY\""
        elif grep -q '^mremap:' "$CODEC2_POLICY"; then
            ABORT "Unsupported mremap rule in ${CODEC2_POLICY//$WORK_DIR\//}"
        else
            LOG "  - Adding the missing mremap rule to ${CODEC2_POLICY//$WORK_DIR\//}"
            EVAL "printf '%s\\n' '$CODEC2_NEW_RULE' >> \"$CODEC2_POLICY\""
        fi

        grep -q -F -x "$CODEC2_NEW_RULE" "$CODEC2_POLICY" || \
            ABORT "Failed to update ${CODEC2_POLICY//$WORK_DIR\//}"

        for CODEC2_SYSCALL_RULE in "setsockopt: 1" "listen: 1" "bind: 1"; do
            if ! grep -q -F -x "$CODEC2_SYSCALL_RULE" "$CODEC2_POLICY"; then
                grep -q -F -x "prctl: 1" "$CODEC2_POLICY" || \
                    ABORT "Unable to locate the Codec2 syscall insertion point"
                LOG "  - Allowing ${CODEC2_SYSCALL_RULE%%:*}"
                EVAL "sed -i '/^prctl: 1$/i$CODEC2_SYSCALL_RULE' \"$CODEC2_POLICY\""
            fi
        done

        for CODEC2_SYSCALL_RULE in "setsockopt: 1" "listen: 1" "bind: 1"; do
            grep -q -F -x "$CODEC2_SYSCALL_RULE" "$CODEC2_POLICY" || \
                ABORT "Failed to add $CODEC2_SYSCALL_RULE to ${CODEC2_POLICY//$WORK_DIR\//}"
        done
    fi
    unset CODEC2_POLICY CODEC2_OLD_RULE CODEC2_NEW_RULE CODEC2_SYSCALL_RULE
    LOG_STEP_OUT
fi

if ${SOURCE_USE_NATIVE_DISPLAY_STACK:-false}; then
    LOG "- Preserving native SurfaceFlinger timing and HFR properties"
else
    LOG_STEP_IN "- Setting SF flags"
    SET_PROP "vendor" "debug.sf.latch_unsignaled" "1"
    SET_PROP "vendor" "debug.sf.high_fps_late_app_phase_offset_ns" "0"
    SET_PROP "vendor" "debug.sf.high_fps_late_sf_phase_offset_ns" "0"
    LOG_STEP_OUT

    LOG_STEP_IN "- Setting Adaptive HFR flags"
    if [[ "$TARGET_CODENAME" != "c1s" && "$TARGET_CODENAME" != "c2s" ]]; then
        SET_PROP "vendor" "debug.sf.show_refresh_rate_overlay_render_rate" "true"
        SET_PROP "vendor" "ro.surface_flinger.game_default_frame_rate_override" "60"
        SET_PROP "vendor" "ro.surface_flinger.use_content_detection_for_refresh_rate" "true"
        SET_PROP "vendor" "ro.surface_flinger.set_idle_timer_ms" "250"
        SET_PROP "vendor" "ro.surface_flinger.set_touch_timer_ms" "300"
        SET_PROP "vendor" "ro.surface_flinger.set_display_power_timer_ms" "200"
        SET_PROP "vendor" "ro.surface_flinger.enable_frame_rate_override" "true"
    elif [[ "$TARGET_CODENAME" == "c1s" ]]; then
        SET_PROP "vendor" "debug.sf.show_refresh_rate_overlay_render_rate" "true"
        SET_PROP "vendor" "ro.surface_flinger.game_default_frame_rate_override" "60"
        SET_PROP "vendor" "ro.surface_flinger.use_content_detection_for_refresh_rate" "false"
        SET_PROP "vendor" "ro.surface_flinger.enable_frame_rate_override" "false"
    elif [[ "$TARGET_CODENAME" == "c2s" ]]; then
        SET_PROP "vendor" "debug.sf.show_refresh_rate_overlay_render_rate" "true"
        SET_PROP "vendor" "ro.surface_flinger.game_default_frame_rate_override" "60"
        SET_PROP "vendor" "ro.surface_flinger.enable_frame_rate_override" "true"
    fi
    LOG_STEP_OUT
fi

# FBE (branch fbe-test): hardware file-based encryption via the Exynos FMP inline crypto engine.
# - Stock "fileencryption=ice" requests Samsung FMP mode 127, which this kernel's fscrypt rejects.
# - Policy v2 is required: /data has casefolded dirs and v1 on casefold fails with EINVAL
#   (init_user0_failed -> recovery). y2s has first_api_level 29, so v2 must be stated explicitly.
# - Standard (non-wrapped) keys: the TEE keymaster cannot create hardware-wrapped storage keys
#   (generateKey -100 -> enablefilecrypto_failed), and the FMP keyslot manager only advertises
#   BLK_CRYPTO_FEATURE_STANDARD_KEYS with AES-256-XTS / 4096-byte data units anyway.
# - "inlinecrypt" is added as an f2fs mount option in column 4 (this libfstab ignores it as an
#   fs_mgr flag). With it, file contents go through blk-crypto, which hands the bio to FMP because
#   FMP supports the mode; the crypto-API fallback is only used if the hardware refuses.
LOG "- Enabling hardware FBE via FMP inline crypto (AES-256-XTS/CTS, policy v2) (fbe-test)"
LINE=$(sed -n "/^\/dev\/block\/by-name\/userdata/=" "$WORK_DIR/vendor/etc/fstab.exynos990")
if sed -n "${LINE}p" "$WORK_DIR/vendor/etc/fstab.exynos990" | grep -q 'fileencryption=ice'; then
    sed -i "${LINE}s/fileencryption=ice/fileencryption=aes-256-xts:aes-256-cts:v2/" "$WORK_DIR/vendor/etc/fstab.exynos990"
    sed -i "${LINE}s/resgid=5678/resgid=5678,inlinecrypt/" "$WORK_DIR/vendor/etc/fstab.exynos990"
    sed -n "${LINE}p" "$WORK_DIR/vendor/etc/fstab.exynos990" | grep -q 'resgid=5678,inlinecrypt' || \
        ABORT "Failed to add the inlinecrypt mount option to the userdata entry"
else
    LOG "\033[0;33m! userdata line has no fileencryption=ice in the stock fstab\033[0m"
fi

# Adoptable volumes: policy v2 (v1 fails on casefolded dirs like media/0 with EINVAL)
SET_PROP "vendor" "ro.crypto.volume.options" "aes-256-xts:aes-256-cts:v2"

# ODE / keydata / keyrefuge (Samsung key storage, needs hermesd which this ROM removes)
sed -i -e "/ODE/d" -e "/keydata/d" -e "/keyrefuge/d" "$WORK_DIR/vendor/etc/fstab.exynos990"

# Adoptable storage: mark the microSD slot as adoptable ("Format as internal", encrypted with FBE)
if ! grep -q "voldmanaged=sdcard:auto,encryptable=userdata" "$WORK_DIR/vendor/etc/fstab.exynos990"; then
    sed -i "s/voldmanaged=sdcard:auto$/voldmanaged=sdcard:auto,encryptable=userdata/" "$WORK_DIR/vendor/etc/fstab.exynos990"
    grep -q "voldmanaged=sdcard:auto,encryptable=userdata" "$WORK_DIR/vendor/etc/fstab.exynos990" || \
        ABORT "Failed to mark the sdcard entry as adoptable"
fi

# Adoptable storage: vold sec_backup EEXIST ignorieren
LOG "- Patching vold for adoptable storage (sec_backup)"
VOLD="$WORK_DIR/system/system/bin/vold"
V_DE_FROM="43c48252d1120094001c0036"
V_DE_TO="43c48252d11200941f2003d5"
V_CE_FROM="43c4825262100094c8021a321f000072d612881a"
V_CE_TO="43c4825262100094c8021a321f0000721f2003d5"
for P in "sec_backup_de:$V_DE_FROM:$V_DE_TO" "sec_backup_ce:$V_CE_FROM:$V_CE_TO"; do
    NAME="${P%%:*}"; REST="${P#*:}"; FROM="${REST%%:*}"; TO="${REST##*:}"
    if xxd -p -c0 "$VOLD" | grep -q "$TO"; then
        LOG "  - vold $NAME patch already applied"
    elif xxd -p -c0 "$VOLD" | grep -q "$FROM"; then
        HEX_PATCH "$VOLD" "$FROM" "$TO" || ABORT "vold $NAME patch failed"
    else
        ABORT "vold $NAME pattern not found"
    fi
done
unset VOLD V_DE_FROM V_DE_TO V_CE_FROM V_CE_TO P NAME REST FROM TO

# FBE TEST: LockSettingsService.unlockCeStorage() passes a Gatekeeper auth token to vold when
# ro.product.first_api_level <= 30 (y2s = 29). The Android 16 vold from the source firmware
# rejects any token ("Vold doesn't use auth tokens" -> EINVAL), so CE storage never unlocks
# once a PIN is set. Lower the threshold to 0 so the token-less path is always used.
# shellcheck disable=SC2016
SMALI_PATCH "system" "system/framework/services.jar" \
    "smali/com/android/server/locksettings/LockSettingsService.smali" "replace" \
    'unlockCeStorage(ILcom/android/server/locksettings/SyntheticPasswordManager$SyntheticPassword;)V' \
    'const/16 v6, 0x1e' \
    'const/16 v6, 0x0'

# For some reason we are missing 2 permissions here: android.hardware.security.model.compatible and android.software.controls
# First one is related to encryption and second one to SmartThings Device Control
LOG "- Patching vendor permissions"
sed -i '$d' "$WORK_DIR/vendor/etc/permissions/handheld_core_hardware.xml"
{
    echo ""
    echo "    <!-- Indicate support for the Android security model per the CDD. -->"
    echo "    <feature name=\"android.hardware.security.model.compatible\"/>"
    echo ""
    echo "    <!--  Feature to specify if the device supports controls.  -->"
    echo "    <feature name=\"android.software.controls\"/>"
    echo "</permissions>"
} >> "$WORK_DIR/vendor/etc/permissions/handheld_core_hardware.xml"

LOG_STEP_IN "- Setting stock Bluetooth profiles"
SET_PROP "product" "bluetooth.profile.asha.central.enabled" "true"
SET_PROP "product" "bluetooth.profile.a2dp.source.enabled" "true"
SET_PROP "product" "bluetooth.profile.avrcp.target.enabled" "true"
SET_PROP "product" "bluetooth.profile.bap.broadcast.assist.enabled" "false"
SET_PROP "product" "bluetooth.profile.bap.broadcast.source.enabled" "false"
SET_PROP "product" "bluetooth.profile.bap.unicast.client.enabled" "false"
SET_PROP "product" "bluetooth.profile.bas.client.enabled" "false"
SET_PROP "product" "bluetooth.profile.csip.set_coordinator.enabled" "false"
SET_PROP "product" "bluetooth.profile.gatt.enabled" "true"
SET_PROP "product" "bluetooth.profile.hap.client.enabled" "false"
SET_PROP "product" "bluetooth.profile.hfp.ag.enabled" "true"
SET_PROP "product" "bluetooth.profile.hid.device.enabled" "true"
SET_PROP "product" "bluetooth.profile.hid.host.enabled" "true"
SET_PROP "product" "bluetooth.profile.map.server.enabled" "true"
SET_PROP "product" "bluetooth.profile.mcp.server.enabled" "false"
SET_PROP "product" "bluetooth.profile.opp.enabled" "false"
SET_PROP "product" "bluetooth.profile.pan.nap.enabled" "true"
SET_PROP "product" "bluetooth.profile.pan.panu.enabled" "true"
SET_PROP "product" "bluetooth.profile.pbap.server.enabled" "true"
SET_PROP "product" "bluetooth.profile.sap.server.enabled" "true"
SET_PROP "product" "bluetooth.profile.ccp.server.enabled" "false"
SET_PROP "product" "bluetooth.profile.vcp.controller.enabled" "false"

if [[ "$SOURCE_PLATFORM_SDK_VERSION" -ge 36 ]]; then
    # Android 16 services.jar uses Bluetooth framework APIs that are not
    # present in the older b0s/r11s prebuilts (for example
    # ScanSettings.Builder#setRssiThreshold).  Keep the source firmware APEX
    # so framework-bluetooth.jar and services.jar remain on the same ABI.
    LOG "  - Keeping source Bluetooth APEX for framework ABI compatibility"
elif [[ "$TARGET_CODENAME" == "r8s" ]]; then
    ADD_TO_WORK_DIR "r11sxxx" "system" "system/apex/com.android.btservices.apex" 0 0 644 "u:object_r:system_file:s0"
else
    ADD_TO_WORK_DIR "b0sxxx" "system" "system/apex/com.android.bt.apex" 0 0 644 "u:object_r:system_file:s0"
fi
LOG_STEP_OUT

# SD card encryption (Samsung DirEncrypt) is dead in this source firmware: the S24 framework stubs out
# StorageManagerService.encryptExternalStorage() (returns OK, does nothing) and DirEncryptService no longer
# has an encryption engine, so the screen hangs forever on "checking SD card". Hide the menu entry.
DECODE_APK "system" "system/priv-app/SecSettings/SecSettings.apk"
SDENC_CTRL="$(find "$APKTOOL_DIR/system/priv-app/SecSettings/SecSettings.apk" -type f \
    -path '*/com/samsung/android/settings/encryption/SDCardEncryptStatusPreferenceController.smali' -printf '%P\n' -quit)"
if [ "$SDENC_CTRL" ]; then
    LOG "- Hiding the non-functional \"Encrypt SD card\" entry"
    SMALI_PATCH "system" "system/priv-app/SecSettings/SecSettings.apk" \
        "$SDENC_CTRL" "return" 'getAvailabilityStatus()I' '3'
else
    LOG "\033[0;33m! SDCardEncryptStatusPreferenceController not found, skipping\033[0m"
fi
unset SDENC_CTRL

# SD card storage mode switch (portable <-> adoptable/encrypted internal), replaces Samsung's dead
# "Encrypt SD card" entry in Settings > Security and privacy > More security settings.
# Source: sdstorage/src (compiled to sdstorage/smali, see sdstorage/README).
LOG_STEP_IN "- Adding SD card storage mode switch to SecSettings"
DECODE_APK "system" "system/priv-app/SecSettings/SecSettings.apk"
SECSET="$APKTOOL_DIR/system/priv-app/SecSettings/SecSettings.apk"

if ! find "$SECSET" -path '*/com/masterrom/sdstorage/SdStorageModeActivity.smali' | grep -q .; then
    N=2
    while [ -d "$SECSET/smali_classes$N" ]; do N=$((N + 1)); done
    EVAL "mkdir -p \"$SECSET/smali_classes$N\""
    EVAL "cp -a \"$MODPATH/sdstorage/smali/.\" \"$SECSET/smali_classes$N/\""
    LOG "- Added SdStorageModeActivity to smali_classes$N"
fi

if ! grep -q 'com.masterrom.sdstorage.SdStorageModeActivity' "$SECSET/AndroidManifest.xml"; then
    sed -i 's#^\(\s*\)</application>#\1    <activity android:name="com.masterrom.sdstorage.SdStorageModeActivity" android:exported="false" android:excludeFromRecents="true" android:launchMode="singleTask" android:configChanges="keyboardHidden|orientation|screenSize|screenLayout|uiMode|density" android:theme="@style/Theme.Settings"/>\n\1</application>#' \
        "$SECSET/AndroidManifest.xml"
fi
grep -q 'com.masterrom.sdstorage.SdStorageModeActivity' "$SECSET/AndroidManifest.xml" || \
    ABORT "Failed to register SdStorageModeActivity in the SecSettings manifest"

SDXML="$SECSET/res/xml/sec_security_advanced_settings.xml"
if grep -q 'android:key="sdcard_encrypt_status"' "$SDXML"; then
    sed -i '/android:key="sdcard_encrypt_status"/c\    <SecPreference android:title="@string/masterrom_sd_storage_title" android:key="masterrom_sd_storage_mode" android:summary="@string/masterrom_sd_storage_summary" android:order="400" settings:controller="com.masterrom.sdstorage.SdStoragePreferenceController"><intent android:action="android.intent.action.MAIN" android:targetPackage="com.android.settings" android:targetClass="com.masterrom.sdstorage.SdStorageModeActivity" /></SecPreference>' "$SDXML"
fi
grep -q 'masterrom_sd_storage_mode' "$SDXML" || ABORT "Failed to add the SD card storage entry to $SDXML"
grep -q 'com.masterrom.sdstorage.SdStoragePreferenceController' "$SDXML" || \
    sed -i 's#android:key="masterrom_sd_storage_mode"#android:key="masterrom_sd_storage_mode" settings:controller="com.masterrom.sdstorage.SdStoragePreferenceController"#' "$SDXML"
grep -q 'com.masterrom.sdstorage.SdStoragePreferenceController' "$SDXML" || ABORT "Failed to attach the SD card storage controller"

# Factory reset from Settings:
#  1. Samsung's MainClearConfirm silently aborts when ro.frp.pst is empty, which
#     unica/patches/frp_migration_compat does on purpose. Read a property that is always set
#     instead; without a PersistentDataBlockService the reset goes straight to doSecMainClear().
#  2. If the SD card is adopted (encrypted internal storage), ResetGuard warns that the card
#     becomes unreadable and only continues with "erase card too" (WIPE_EXTERNAL_STORAGE ->
#     StorageManager.wipeAdoptableDisks() formats it as portable before the reboot).
F="$(find "$SECSET" -path '*/com/android/settings/MainClearConfirm.smali' | head -n 1)"
[ -n "$F" ] || ABORT "MainClearConfirm.smali not found"
sed -i 's#const-string \(v[0-9]*\), "ro.frp.pst"#const-string \1, "ro.product.device"#' "$F"
grep -q '"ro.frp.pst"' "$F" && ABORT "Failed to patch the factory reset FRP check"
if ! grep -q 'com/masterrom/sdstorage/ResetGuard' "$F"; then
    perl -0pi -e 's/(\.method public final onResetButtonClick\(\)V\n\s*\.locals [1-9]\d*\n)/$1\n    invoke-static {p0}, Lcom\/masterrom\/sdstorage\/ResetGuard;->intercept(Lcom\/android\/settings\/MainClearConfirm;)Z\n\n    move-result v0\n\n    if-eqz v0, :masterrom_reset_go\n\n    return-void\n\n    :masterrom_reset_go\n/' "$F"
fi
grep -q 'com/masterrom/sdstorage/ResetGuard;->intercept' "$F" || ABORT "Failed to hook the SD card check into the factory reset"

# SystemUI's "Moving content" / "SD card ready" notifications open the stock storage wizard
# (StorageWizardMigrateProgress, StorageWizardReady). Forward both to the SD card page, which
# shows the running move itself (SdStorageModeActivity.redirectFromWizard / resumeMove).
for W in StorageWizardMigrateProgress StorageWizardReady; do
    F="$(find "$SECSET" -path "*/com/android/settings/deviceinfo/$W.smali" | head -n 1)"
    [ -n "$F" ] || ABORT "$W.smali not found"
    if ! grep -q 'SdStorageModeActivity;->redirectFromWizard' "$F"; then
        SUPER="$(sed -n 's/^\.super \(L.*;\)$/\1/p' "$F" | head -n 1)"
        [ -n "$SUPER" ] || ABORT "$W: superclass not found"
        # at the very start of onCreate (only the parameters are live there): forward, run the
        # superclass onCreate (Android requires it) and finish
        SUPER="$SUPER" perl -0pi -e 's/(\.method (?:public |protected )(?:final )?onCreate\(Landroid\/os\/Bundle;\)V\n\s*\.locals )0\n/${1}1\n/; s/(\.method (?:public |protected )(?:final )?onCreate\(Landroid\/os\/Bundle;\)V\n\s*\.locals [1-9]\d*\n)/$1\n    invoke-static {p0}, Lcom\/masterrom\/sdstorage\/SdStorageModeActivity;->redirectFromWizard(Landroid\/app\/Activity;)Z\n\n    move-result v0\n\n    if-eqz v0, :masterrom_wizard_go\n\n    invoke-super {p0, p1}, $ENV{SUPER}->onCreate(Landroid\/os\/Bundle;)V\n\n    invoke-virtual {p0}, Landroid\/app\/Activity;->finish()V\n\n    return-void\n\n    :masterrom_wizard_go\n/' "$F"
    fi
    grep -q 'SdStorageModeActivity;->redirectFromWizard' "$F" || ABORT "Failed to forward $W to the SD card page"
    LOG "- $W forwards to the SD card page"
done
unset W SUPER

# SD card used as internal storage (adopted): only the system (Settings, factory reset), root and
# the shell may format or repartition it. Other apps (e.g. My Files) are refused and the SD card
# page opens with an explanation instead. Lives in services.jar, so My Files updates keep it.
# Source: sdguard/src (compiled to sdguard/smali by .github/workflows/sdstorage.yml).
DECODE_APK "system" "system/framework/services.jar"
SVC="$APKTOOL_DIR/system/framework/services.jar"
if ! find "$SVC" -path '*/com/masterrom/storageguard/AdoptedSdGuard.smali' | grep -q .; then
    [ -f "$MODPATH/sdguard/smali/com/masterrom/storageguard/AdoptedSdGuard.smali" ] || \
        ABORT "sdguard/smali missing: run the \"SD storage page (Java -> smali)\" workflow"
    N=2
    while [ -d "$SVC/smali_classes$N" ]; do N=$((N + 1)); done
    EVAL "mkdir -p \"$SVC/smali_classes$N\""
    EVAL "cp -a \"$MODPATH/sdguard/smali/.\" \"$SVC/smali_classes$N/\""
    LOG "- Added AdoptedSdGuard to services.jar smali_classes$N"
fi
F="$(find "$SVC" -path '*/com/android/server/StorageManagerService.smali' | head -n 1)"
[ -n "$F" ] || ABORT "StorageManagerService.smali not found"
for M in 'format(Ljava/lang/String;)V' 'partitionPublic(Ljava/lang/String;)V' \
         'partitionPrivate(Ljava/lang/String;)V' 'partitionMixed(Ljava/lang/String;I)V'; do
    if ! grep -A3 -F ".method public $M" "$F" | grep -q 'AdoptedSdGuard;->check'; then
        M="$M" perl -0pi -e 's/(\.method public (?:final )?\Q$ENV{M}\E\n\s*\.locals \d+\n)/$1\n    invoke-static {p1}, Lcom\/masterrom\/storageguard\/AdoptedSdGuard;->check(Ljava\/lang\/String;)V\n/' "$F"
    fi
    if grep -A3 -F ".method public $M" "$F" | grep -q 'AdoptedSdGuard;->check'; then
        LOG "- StorageManagerService.$M: SD card guard added"
    elif [[ "$M" == partitionPublic* ]] || [[ "$M" == format* ]]; then
        ABORT "Failed to add the SD card guard to StorageManagerService.$M"
    else
        LOGW "StorageManagerService.$M not found, SD card guard skipped there"
    fi
done
unset SVC F M N

for L in "values:Use SD card as internal storage:Switch between portable and encrypted internal storage" \
         "values-de:SD-Karte als internen Speicher nutzen:Zwischen tragbarem und verschlüsseltem internem Speicher wechseln"; do
    DIR="${L%%:*}"; REST="${L#*:}"; TITLE="${REST%%:*}"; SUMMARY="${REST#*:}"
    F="$SECSET/res/$DIR/strings.xml"
    [ -f "$F" ] || continue
    if ! grep -q 'name="masterrom_sd_storage_title"' "$F"; then
        sed -i "s#</resources>#    <string name=\"masterrom_sd_storage_title\">$TITLE</string>\n    <string name=\"masterrom_sd_storage_summary\">$SUMMARY</string>\n</resources>#" "$F"
    fi
done
grep -q 'name="masterrom_sd_storage_title"' "$SECSET/res/values/strings.xml" || \
    ABORT "Failed to add the SD card storage strings"
unset SECSET SDXML N L DIR REST TITLE SUMMARY F
LOG_STEP_OUT
