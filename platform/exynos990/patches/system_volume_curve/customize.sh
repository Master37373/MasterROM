# Speaker volume tuning for the S20+ (DEFAULT_*_VOLUME_CURVE from the S20+ vendor).
# 1. System sounds (volume click, sound mode switch ...): the stock curve starts at -24 dB,
#    so step 1 is loud. Steeper curve, the maximum stays at -6 dB.
# 2. Alarm: the stock curve starts at -29.7 dB, the low steps are hard to hear. Raise the
#    lower range, the maximum stays at 0 dB. Ringtone and notification keep the stock curve.
# 3. Lock/unlock, screenshot, keyboard, touch and key tones do not use the system curve but
#    Samsung's own per-step tables (situation_audio_policy_volumes_sec.xml). Lower their
#    low steps (-14 dB at the bottom, about -6 dB in the middle, unchanged at the top).
# Only speaker entries are touched; earpiece, headset, Bluetooth and media keep their stock curves.
F="$WORK_DIR/vendor/etc/audio_policy_volumes.xml"
[ -f "$F" ] || ABORT "audio_policy_volumes.xml not found"

if ! grep -q 'MasterROM: speaker volume curves v2' "$F"; then
    N="$(perl -0pi -e '
        # undo v1 (steeper system curve) if present, then write v2
        s#<!-- MasterROM: system sound curve, quieter low steps -->\s*<volume stream="AUDIO_STREAM_SYSTEM" deviceCategory="DEVICE_CATEGORY_SPEAKER">.*?</volume>#<volume stream="AUDIO_STREAM_SYSTEM" deviceCategory="DEVICE_CATEGORY_SPEAKER" ref="DEFAULT_SYSTEM_VOLUME_CURVE"/>#s;
        $n = 0;
        $n += s#<volume stream="AUDIO_STREAM_SYSTEM" deviceCategory="DEVICE_CATEGORY_SPEAKER"\s*ref="DEFAULT_SYSTEM_VOLUME_CURVE"\s*/>#<!-- MasterROM: speaker volume curves v2 (system) -->\n    <volume stream="AUDIO_STREAM_SYSTEM" deviceCategory="DEVICE_CATEGORY_SPEAKER">\n        <point>1,-3200</point>\n        <point>33,-2300</point>\n        <point>66,-1400</point>\n        <point>100,-600</point>\n    </volume>#;
        for $st ("ALARM") {
            $n += s#(<volume stream="AUDIO_STREAM_$st" deviceCategory="DEVICE_CATEGORY_SPEAKER">)\s*<point>([01]),-2970</point>\s*<point>33,-2010</point>\s*<point>66,-1020</point>\s*<point>100,0</point>\s*(</volume>)#$1\n        <point>$2,-2400</point>\n        <point>33,-1600</point>\n        <point>66,-800</point>\n        <point>100,0</point>\n    $3#;
        }
        print STDOUT $n;
    ' "$F")"
    [ "$N" = 2 ] || ABORT "Speaker volume curves: replaced $N of 2 (system, alarm)"
fi
LOG "- Speaker: system -32..-6 dB, alarm -24..0 dB, ringtone and notification stock"

S=""
for p in "$WORK_DIR/vendor/etc" "$WORK_DIR/system/system/etc"; do
    [ -f "$p/situation_audio_policy_volumes_sec.xml" ] && S="$p/situation_audio_policy_volumes_sec.xml" && break
done
if [ -z "$S" ]; then
    LOGW "situation_audio_policy_volumes_sec.xml not found, lock screen/keyboard tones stay stock"
elif ! grep -q 'MasterROM: quieter low steps' "$S"; then
    perl -0pi -e '
        use POSIX qw(floor);
        my %want = map { $_ => 1 } qw(stv_lock_screen stv_unlock_screen stv_keyboard stv_touch_tone stv_key_tone stv_shutter);
        my $n = 0;
        s{(<situation type="(\w+)"[^>]*>)(.*?)(</situation>)}{
            my ($open, $type, $body, $close) = ($1, $2, $3, $4);
            if ($want{$type}) {
                $body =~ s{(<volume device="AUDIO_DEVICE_OUT_SPEAKER">\s*)([\d,\s]+?)(\s*</volume>)}{
                    my ($a, $list, $c) = ($1, $2, $3);
                    my @v = split /\s*,\s*/, $list =~ s/^\s+|\s+$//gr;
                    my $last = $#v || 1;
                    for my $i (0 .. $#v) {
                        my $att = 14 * (1 - $i / $last) ** 1.3;    # dB: 14 at the bottom, ~6 in the middle, 0 at the top
                        my $x = floor($v[$i] * 10 ** (-$att / 20) + 0.5);
                        $x = 1 if $x < 1 && $v[$i] > 0;
                        $v[$i] = $x;
                    }
                    $n++;
                    $a . join(", ", map { sprintf "%4d", $_ } @v) . $c;
                }se;
                $open = "<!-- MasterROM: quieter low steps -->\n        " . $open;
            }
            $open . $body . $close;
        }gse;
        print STDERR "situation tables lowered: $n\n";
    ' "$S"
    grep -q 'MasterROM: quieter low steps' "$S" || ABORT "Failed to lower the lock screen/keyboard tone tables"
    LOG "- Lock screen, screenshot, keyboard, touch and key tones: low steps up to -14 dB quieter"
fi
unset F S
