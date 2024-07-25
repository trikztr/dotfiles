#!/bin/bash

# Function to get the current Mullvad VPN status
get_mullvad_status() {
    # Retrieve the VPN status and get only the first line of output
    mullvad status | head -n 1
}

# Function to focus the Mullvad GUI application if it is running
focus_mullvad_gui() {
    # Check if the Mullvad GUI process is running
    local app_procs
    app_procs=$(pgrep mullvad-gui)
    if [[ -n "$app_procs" ]]; then
        # If the GUI is running, focus it using hyprland_show_app
        hyprland_show_app "Mullvad VPN"
    fi
}

# Function to toggle the VPN connection based on the current status
toggle_vpn_connection() {
    local status="$1"
    if [[ "$status" == *"Disconnected"* ]]; then
        # If the VPN is disconnected, connect it
        mullvad connect
    else
        # If the VPN is connected, disconnect it
        mullvad disconnect
    fi
}

# Function to print the current VPN status
print_vpn_status() {
    local status="$1"
    if [[ "$status" == *"Disconnected"* ]]; then
        # Print "Disconnected" if the VPN is not connected
        echo "Disconnected"
    else
        # Extract and print the name of the connected interface from the status
        local interface_name
        interface_name=$(echo "$status" | awk '{print $3}')
        echo "$interface_name"
    fi
}

# Main script logic
if [[ "$1" == "status" ]]; then
    # If the argument is "status", print the current VPN status
    status=$(get_mullvad_status)
    print_vpn_status "$status"
else
    # Check if the Mullvad GUI is running
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

