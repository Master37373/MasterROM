#!/system/bin/sh
# MasterROM: "Settings > Reset > Factory data reset" with TWRP.
#
# One UI writes the wipe request only to /cache/recovery/command and reboots to
# recovery. Samsung's stock recovery reads that file; TWRP looks for it before it
# has mounted /cache, never sees it and simply stops in its main menu.
# TWRP does run OpenRecoveryScripts from /cache/recovery reliably (the updater
# uses them too), so translate the wipe request into one.
#
# Started by init when a reboot to recovery begins (sys.shutdown.requested=1recovery);
# One UI has written the command file at that point. Normal reboots to recovery
# (no --wipe_data) and pending update scripts are left alone.
# Runs as user system: the command file is system:system 0600, /cache/recovery is system:cache 0770.

CMD=/cache/recovery/command
ORS=/cache/recovery/openrecoveryscript

[ -f "$CMD" ] || exit 0
grep -q -e '^--wipe_data' "$CMD" || exit 0
[ -e "$ORS" ] && exit 0

# Same as the stock reset: erase all user data including internal storage.
printf 'format data\nreboot\n' > "$ORS.tmp" && mv -f "$ORS.tmp" "$ORS"
chmod 0644 "$ORS"
sync
log -p i -t mr_factory_reset "factory reset requested: TWRP will format data"
exit 0
