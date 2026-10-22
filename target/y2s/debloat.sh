# MasterROM: Galaxy S20+ (y2s) – preinstalled apps like on a stock Galaxy S24+ (SM-S926B EUX).
#
# Sourced after unica/debloat.sh and platform/exynos990/debloat.sh (unica/patches/_debloat),
# so it can take Samsung system apps back out of their delete lists. Brought back: Gaming Hub,
# Samsung Kids, Samsung Language Core, Smart Touch Call, Microsoft OneDrive. Everything else UN1CA
# removes stays removed (Link to Windows stays the stub). Other partner apps (Meta, Office, ...) come
# like on stock through "Recommended apps" in the setup wizard.

# KEEP <partition list variable> <entry>... : removes exact entries from a debloat list
KEEP()
{
    local VAR="$1"
    shift
    local LIST="${!VAR}"
    local e
    for e in "$@"; do
        LIST="$(grep -v -x -F -- "$e" <<< "$LIST")"
    done
    printf -v "$VAR" '%s' "$LIST"
}

# Gaming Hub
KEEP SYSTEM_DEBLOAT \
    "system/etc/permissions/privapp-permissions-com.samsung.android.game.gamehome.xml" \
    "system/priv-app/GameHome"

# Samsung Kids
KEEP SYSTEM_DEBLOAT \
    "system/etc/permissions/signature-permissions-com.sec.android.app.kidshome.xml" \
    "system/app/KidsHome_Installer"

# Samsung Language Core
KEEP SYSTEM_DEBLOAT \
    "system/etc/permissions/signature-permissions-com.samsung.android.offline.languagemodel.xml" \
    "system/priv-app/OfflineLanguageModel_stub"

# Smart Touch Call
KEEP SYSTEM_DEBLOAT \
    "system/etc/default-permissions/default-permissions-com.samsung.android.visualars.xml" \
    "system/etc/permissions/privapp-permissions-com.samsung.android.visualars.xml" \
    "system/priv-app/SmartTouchCall"

# Microsoft OneDrive (part of the S24+ home screen layout)
KEEP SYSTEM_DEBLOAT \
    "system/etc/permissions/privapp-permissions-com.microsoft.skydrive.xml" \
    "system/priv-app/OneDrive_Samsung_v3"

unset -f KEEP
