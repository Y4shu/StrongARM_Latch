#!/bin/sh
set -eu
cd "$(dirname "$0")"
mkdir -p results
command -v hspice >/dev/null || { echo 'Activate the campus HSPICE environment first.' >&2; exit 1; }
for deck in 02_delay 03_ramp_overshoot 04_ramp_power 05_kickback_plus 06_kickback_minus 07_nominal_offset; do
    hspice -i "$deck.sp" -o "results/$deck"
done
printf '%s\n' 'Review results/*.lis for concluded jobs and failed measurements.'
