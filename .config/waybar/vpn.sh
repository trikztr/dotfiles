#!/bin/bash

# Function to get the current Mullvad VPN status
get_mullvad_status() {
    mullvad status | head -n 1
}

# Function to focus the Mullvad GUI app
focus_mullvad_gui() {
    hyprland_show_app "Mullvad VPN"
}

# Function to toggle the VPN connection based on the current status
toggle_vpn_connection() {
    local status="$1"
    if [[ "$status" == *"Disconnected"* ]]; then
        mullvad connect
    else
        mullvad disconnect
    fi
}

# Function to print the current VPN status
print_vpn_status() {
    local status="$1"
    if [[ "$status" == *"Disconnected"* ]]; then
        echo "Disconnected"
    else
        # Extract and print the name of the connected interface from the status
        local interface_name
        interface_name=$(echo "$status" | awk '{print $3}')
        echo "$interface_name"
    fi
}

if [[ "$1" == "status" ]]; then
    status=$(get_mullvad_status)
    print_vpn_status "$status"
else
    # Check if the Mullvad GUI app is running
    app_procs=$(pgrep mullvad-gui)
    if [[ -n "$app_procs" ]]; then
        # If the GUI is running, focus the application
        focus_mullvad_gui
    else
        # If the GUI is not running, toggle the VPN connection based on the current status
        status=$(get_mullvad_status)
        toggle_vpn_connection "$status"
    fi
fi

