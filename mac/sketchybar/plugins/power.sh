#!/usr/bin/env bash

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ -z "$PERCENTAGE" ]; then
	exit 0
fi

# Generate battery level using a series of blocks
case ${PERCENTAGE} in
	9[0-9] | 100) ICON="■■■■■" ;;    # Full
	[7-8][0-9]) ICON="■■■■" ;;       # High
	[5-6][0-9]) ICON="■■■" ;;        # Medium
	[3-4][0-9]) ICON="■■" ;;         # Low
	[1-2][0-9]) ICON="■" ;;          # Critical
	*) ICON="□" ;;                   # Very low or empty
esac

# Add charging icon if charging
if [ -n "$CHARGING" ]; then
	ICON="⚡$ICON"  # Prepend the lightning bolt
fi

sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%"

