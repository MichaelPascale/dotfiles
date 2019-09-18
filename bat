#!/bin/bash


notify-send "Battery Status" "$(bat)"

while true
do
    battery_percent=$(acpi -b | grep -P -o '[0-9]+(?=%)')
    charging=$(acpi -b | grep -v "Charging")

    if [ -z "$charging" ]; then
        if [ "$battery_percent" -gt 95 ]; then
            notify-send "Battery Full." "Level: ${battery_percent}% "
        fi
    elif [ "$battery_percent" -le 25 -a "$battery_percent" -gt 10 ]; then
        notify-send "Battery Low." "Level: ${battery_percent}% "
    elif [ "$battery_percent" -le 10 ]; then
        notify-send -u critical "Battery Critical!" "Level: ${battery_percent}% "
    fi

    sleep 240
done
