#!/bin/bash

# Define the directory and theme
dir="$HOME/.config/rofi/powermenu/type-1"
theme='style-1.rasi'

# Function to list available Wi-Fi networks
list_networks() {
    nmcli -t -f SSID dev wifi list | grep -v '^--$' | sort -u
}

# Function to check if a network is already configured
is_configured() {
    nmcli con show | grep -q "^$1$"
}

# Function to connect to a configured network
connect_configured() {
    nmcli con up id "$1"
}

# Function to connect to a new network
connect_new() {
    local ssid="$1"
    local password="$2"
    nmcli dev wifi connect "$ssid" password "$password"
}

# List available Wi-Fi networks
networks=$(list_networks)

# Use Rofi to select a network with the specified theme
selected_network=$(echo "$networks" | rofi -dmenu -p "Select Wi-Fi network:" -theme "$dir/$theme")

if [ -z "$selected_network" ]; then
    exit 1
fi

# Check if the network is already configured
if is_configured "$selected_network"; then
    # Network is already configured, connect to it
    connect_configured "$selected_network"
else
    # Network is not configured, ask for password with the specified theme
    password=$(rofi -dmenu -p "Enter password for $selected_network:" -theme "$dir/$theme" -password)
    
    if [ -z "$password" ]; then
        exit 1
    fi

    # Connect to the new network
    connect_new "$selected_network" "$password"
fi

