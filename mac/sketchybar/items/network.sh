#!/usr/bin/env bash

# Define the network interface and the sketchybar item name
INTERFACE="en0"             # Replace with your actual network interface if different
ITEM_NAME="network"   # Must match the item name in sketchybar configuration

# Function to get bytes transmitted and received
get_network_bytes() {
    netstat -ibn | awk -v iface="$INTERFACE" '$0 ~ iface && $0 !~ /Link/ {rx += $7; tx += $10} END {print rx, tx}'
}

# Get initial bytes
read rx_bytes_initial tx_bytes_initial <<< $(get_network_bytes)

# Validate initial readings
if [[ -z "$rx_bytes_initial" || -z "$tx_bytes_initial" ]]; then
    sketchybar --set "$ITEM_NAME" label="Network Error"
    exit 1
fi

sleep 1  # Wait 1 second to calculate speed

# Get final bytes
read rx_bytes_final tx_bytes_final <<< $(get_network_bytes)

# Calculate speeds in KB/s
rx_speed=$(( (rx_bytes_final - rx_bytes_initial) / 1024 ))
tx_speed=$(( (tx_bytes_final - tx_bytes_initial) / 1024 ))

# Handle potential negative values
(( rx_speed < 0 )) && rx_speed=0
(( tx_speed < 0 )) && tx_speed=0

# Update the sketchybar item with speeds
sketchybar --set "$ITEM_NAME" label="⬇️ ${rx_speed}KB/s ⬆️ ${tx_speed}KB/s"

