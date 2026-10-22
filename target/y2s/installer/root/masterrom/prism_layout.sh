#!/system/bin/sh
# MasterROM: puts the home screen layout (default_workspace.xml) into the device's own prism
# partition, so One UI Home starts with the MasterROM layout after the first setup / Format Data.
# The device keeps its own prism (model and CSC stay as they are); only the content of the existing
# carriers/*/default_workspace.xml files is replaced. Anything unexpected -> prism stays untouched.

SRC=/tmp/masterrom_default_workspace.xml
DEV=/dev/block/by-name/prism
MNT=/tmp/masterrom_prism

log() { echo "masterrom-prism: $*"; }

[ -f "$SRC" ] || { log "layout missing, skipped"; exit 0; }
[ -b "$DEV" ] || { log "no prism partition, skipped"; exit 0; }
for t in tune2fs e2fsck; do
    command -v "$t" >/dev/null 2>&1 || { log "$t missing, skipped"; exit 0; }
done

# Samsung images with shared blocks cannot be mounted read-write
if tune2fs -l "$DEV" 2>/dev/null | grep -i '^Filesystem features' | grep -qi 'shared_blocks'; then
    log "shared_blocks, skipped"
    exit 0
fi

umount /prism >/dev/null 2>&1
e2fsck -n "$DEV" >/dev/null 2>&1 || { log "filesystem check failed, skipped"; exit 0; }

mkdir -p "$MNT"
mount -t ext4 -o rw,noatime "$DEV" "$MNT" || { log "mount failed, skipped"; exit 0; }

N=0
for f in "$MNT"/etc/carriers/*/default_workspace.xml "$MNT"/etc/carriers/single/*/default_workspace.xml; do
    [ -f "$f" ] || continue
    cmp -s "$SRC" "$f" && continue
    # overwrite the content only: inode, owner, mode and SELinux label stay
    cat "$SRC" > "$f" && N=$((N + 1))
done

sync
umount "$MNT"
rmdir "$MNT" 2>/dev/null
e2fsck -p "$DEV" >/dev/null 2>&1
log "home screen layout set in $N place(s)"
exit 0
