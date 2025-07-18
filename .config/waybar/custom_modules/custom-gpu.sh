#!/bin/bash

raw_clock=$(cat /sys/class/drm/card1/device/pp_dpm_sclk | grep -oe '[0-9]{0,4}Mhz \W' | sed "s/Mhz \*//")
clock=$(echo "scale=1;$raw_clock/1000" | bc | sed -e 's/^-\./-0./' -e 's/^\./0./')

raw_temp=$(cat /sys/class/drm/card1/device/hwmon/hwmon4/temp1_input)
temperature=$(($raw_temp/1000))
busypercent=$(cat /sys/class/hwmon/hwmon4/device/gpu_busy_percent)
deviceinfo=$(glxinfo -B | grep 'Device:' | sed 's/^.*: //')
driverinfo=$(glxinfo -B | grep "OpenGL version")

echo '{"text": "'$clock'GHz |   '$temperature'°C <span color=\"darkgray\">| '$busypercent'%</span>", "class": "custom-gpu", "tooltip": "<b>'$deviceinfo'</b>\n'$driverinfo'"}'
