DECODE_APK "system" "system/priv-app/SecSetupWizard_Global/SecSetupWizard_Global.apk"

LOG "- Enabling navigation bar type settings step"
SETUPWIZARD_APK="$APKTOOL_DIR/system/priv-app/SecSetupWizard_Global/SecSetupWizard_Global.apk"
NAV_STEP_FILE="$(find "$SETUPWIZARD_APK" -type f -name '*.smali' \
    -exec grep -lF '"navigationbar_setting"' {} + \
    | grep -v '/com/sec/android/app/SecSetupWizard/SecSetupWizardActivity.smali$' | sed -n '1p')"
[ "$NAV_STEP_FILE" ] || ABORT "Navigation bar setup step implementation not found"
NAV_STEP_METHOD="$(awk '/^\.method/{method=$0} /"navigationbar_setting"/{print method; exit}' "$NAV_STEP_FILE" \
    | sed -E 's/^\.method ([^ ]+ )*//')"
NAV_STEP_FILE="${NAV_STEP_FILE//$SETUPWIZARD_APK\//}"
SMALI_PATCH "system" "system/priv-app/SecSetupWizard_Global/SecSetupWizard_Global.apk" \
    "$NAV_STEP_FILE" "replace" \
    "$NAV_STEP_METHOD" \
    "navigationbar_setting" \
    "this_string_does_not_exist" \
    > /dev/null
SETUPWIZARD_ACTIVITY="smali/com/sec/android/app/SecSetupWizard/SecSetupWizardActivity.smali"
SETUPWIZARD_ACTIVITY_METHOD="$(awk '/^\.method/{method=$0} /"navigationbar_setting"/{print method; exit}' \
    "$SETUPWIZARD_APK/$SETUPWIZARD_ACTIVITY" | sed -E 's/^\.method ([^ ]+ )*//')"
SMALI_PATCH "system" "system/priv-app/SecSetupWizard_Global/SecSetupWizard_Global.apk" \
    "$SETUPWIZARD_ACTIVITY" "replace" \
    "$SETUPWIZARD_ACTIVITY_METHOD" \
    "navigationbar_setting" \
    "this_string_does_not_exist" \
    > /dev/null
unset SETUPWIZARD_APK NAV_STEP_FILE NAV_STEP_METHOD SETUPWIZARD_ACTIVITY SETUPWIZARD_ACTIVITY_METHOD

# Keep the "Recommended apps" (omcagent) step in the setup wizard
