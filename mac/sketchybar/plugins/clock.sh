#!/usr/bin/env bash

# LABEL=$(date '+%H:%M:%S')
# sketchybar --set "$NAME" label="$LABEL"

LABEL=$(date '+%H:%M:%S')
ICON="󰥔"  # Choose an icon that resembles a clock

sketchybar --set "$NAME" icon="$ICON" label="$LABEL"

