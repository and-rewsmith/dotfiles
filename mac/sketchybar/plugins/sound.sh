#!/usr/bin/env bash

VOLUME=$(osascript -e "output volume of (get volume settings)")
MUTED=$(osascript -e "output muted of (get volume settings)")

if [ "$MUTED" != "false" ]; then
    ICON="󰖁"  # Mute icon
    VOLUME=0
else
    case ${VOLUME} in
        100) ICON="󰓃" ;;   # Full volume icon
        [5-9]*) ICON="󰓃" ;; # Mid volume icon
        [0-4]*) ICON="󰓃" ;; # Low volume icon
        *) ICON="󰓃" ;;      # Fallback low volume
    esac
fi

sketchybar -m \
    --set "$NAME" icon="$ICON" \
    --set "$NAME" label="${VOLUME}%"

