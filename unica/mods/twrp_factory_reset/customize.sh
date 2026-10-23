# SELinux domain for /system/bin/mr_factory_reset.sh: init -> mr_factory_reset,
# may only read the recovery command and write the OpenRecoveryScript in /cache/recovery.
SEPOLICY="$WORK_DIR/system/system/etc/selinux/plat_sepolicy.cil"

if ! grep -q "(type mr_factory_reset)" "$SEPOLICY"; then
    LOG "- Adding SELinux domain mr_factory_reset"
    sed -i \
        -e "/^(typeattributeset exec_type\b/ s/))/mr_factory_reset_exec ))/" \
        -e "/^(typeattributeset file_type\b/ s/))/mr_factory_reset_exec ))/" \
        -e "/^(typeattributeset system_file_type\b/ s/))/mr_factory_reset_exec ))/" \
        -e "/^(typeattributeset domain\b/ s/))/mr_factory_reset ))/" \
        "$SEPOLICY"

    cat <<'CIL' >> "$SEPOLICY"
; Added by unica/mods/twrp_factory_reset/customize.sh
(type mr_factory_reset)
(roletype object_r mr_factory_reset)
(type mr_factory_reset_exec)
(roletype object_r mr_factory_reset_exec)
(typetransition init mr_factory_reset_exec process mr_factory_reset)
(allow init mr_factory_reset (process (transition)))
(allow init mr_factory_reset (process (noatsecure rlimitinh siginh)))
(allow init mr_factory_reset_exec (file (read open execute getattr map)))
(allow mr_factory_reset mr_factory_reset_exec (file (entrypoint read open execute getattr map)))
(allow mr_factory_reset init (fd (use)))
(allow mr_factory_reset shell_exec (file (read open execute getattr map execute_no_trans)))
(allow mr_factory_reset toolbox_exec (file (read open execute getattr map execute_no_trans)))
(allow mr_factory_reset system_file (file (read open execute getattr map execute_no_trans)))
(allow mr_factory_reset cache_file (dir (search getattr)))
(allow mr_factory_reset cache_recovery_file (dir (search getattr read open write add_name remove_name)))
(allow mr_factory_reset cache_recovery_file (file (create read write open getattr setattr rename)))
(allow mr_factory_reset null_device (chr_file (read write getattr ioctl)))
(allow mr_factory_reset logdw_socket (sock_file (write)))
(allow mr_factory_reset logd (unix_dgram_socket (sendto)))
CIL
fi

unset SEPOLICY
