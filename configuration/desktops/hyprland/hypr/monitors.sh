#!/usr/bin/env bash

monitor() {
    MONITOR_COUNT=$(hyprctl monitors all | grep -c "Monitor")

    if [ "$MONITOR_COUNT" -gt 1 ]; then
        hyprctl keyword monitor "eDP-1, disable"
    else
        hyprctl keyword monitor "eDP-1, preferred, auto, auto"
    fi
}

handle() {
    case $1 in
    monitoradded* | monitorremoved*) monitor ;;
    esac
}

# Initializations.
monitor

# Listen to Hyprland events.
socat -U - "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" |
    while read -r line; do handle "$line"; done
