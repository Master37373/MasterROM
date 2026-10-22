# System sounds (touch, lock, screenshot ...) on the speaker use DEFAULT_SYSTEM_VOLUME_CURVE from
# the S20+ vendor: -24 dB at the lowest step up to -6 dB at the top, so even step 1 is loud.
# Replace only the speaker entry of AUDIO_STREAM_SYSTEM with a steeper curve; the maximum stays
# at -6 dB. Earpiece, headset and all other streams keep their stock curves.
F="$WORK_DIR/vendor/etc/audio_policy_volumes.xml"
[ -f "$F" ] || ABORT "audio_policy_volumes.xml not found"

if ! grep -q 'MasterROM: system sound curve' "$F"; then
    perl -0pi -e 's#<volume stream="AUDIO_STREAM_SYSTEM" deviceCategory="DEVICE_CATEGORY_SPEAKER"\s*ref="DEFAULT_SYSTEM_VOLUME_CURVE"\s*/>#<!-- MasterROM: system sound curve, quieter low steps -->\n    <volume stream="AUDIO_STREAM_SYSTEM" deviceCategory="DEVICE_CATEGORY_SPEAKER">\n        <point>1,-4200</point>\n        <point>33,-2800</point>\n        <point>66,-1600</point>\n        <point>100,-600</point>\n    </volume>#' "$F"
fi
grep -q 'MasterROM: system sound curve' "$F" || ABORT "Failed to replace the system sound volume curve"
LOG "- System sounds: speaker volume curve -42 dB .. -6 dB"
