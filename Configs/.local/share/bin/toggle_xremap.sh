#!/bin/bash

# Path to your configuration file
CONFIG_FILE="$HOME/.config/xremap/config.yml"
DEVICE_NAME="HOLTEK A87 Gaming Keyboard"  # Change it to ur keyboard !!!

# Function to get the event device for the given device name
get_device_event() {
    local device_event
    device_event=$(grep -E -A 4 "$DEVICE_NAME" /proc/bus/input/devices | grep -Po 'event\d+' | head -n 1)
    if [[ -z "$device_event" ]]; then
        echo "Error: Failed to find the event handler for '$DEVICE_NAME'"
        exit 1
    fi
    echo "$device_event"
}

# Function to start xremap
start_xremap() {
    DEVICE="/dev/input/$(get_device_event)"
    if [ -z "$DEVICE" ]; then
        echo "Error: Failed to find the device '$DEVICE_NAME'"
        return 1
    fi

    echo "Starting xremap on $DEVICE..."

    # Read sudo password in advance to avoid blocking / REBOOTS!
    read -s -p "Enter your sudo password: " SUDO_PASSWORD
    echo

    # Run xremap with nohup and redirect output to a temporary file
    TEMP_LOG=$(mktemp)  # Create a temporary file
    echo "Temporary log file created at: $TEMP_LOG"  # Print the location
    echo "$SUDO_PASSWORD" | sudo -S nohup xremap --device "$DEVICE" "$CONFIG_FILE" > "$TEMP_LOG" 2>&1 &

    # Wait for xremap to start, looping to check its status
    local timeout=10  # Timeout after 10 seconds if xremap doesn't start
    while [[ $timeout -gt 0 ]]; do
        if pgrep -x "xremap" > /dev/null; then
            echo "xremap is running."
            break
        fi
        sleep 1
        timeout=$((timeout - 1))
    done

    if [[ $timeout -le 0 ]]; then
        echo "Error: Failed to start xremap after waiting."
        return 1
    fi

    # Display the output of the device selection
    echo "Device selection output:"
    cat "$TEMP_LOG"  # Display the content of the temp log
    rm "$TEMP_LOG"   # Remove the temporary file
}

# Function to stop xremap
stop_xremap() {
    echo "You will need to enter your sudo password to stop xremap."
    # Use a subshell to handle sudo
    if sudo bash -c "pkill xremap"; then
        echo "xremap disabled."
    else
        echo "Failed to disable xremap. It might be running with different privileges."
    fi
}

# Function to handle Ctrl + C (SIGINT)
trap_ctrl_c() {
    echo "Ctrl + C pressed. Stopping xremap..."
    stop_xremap
    exit 0  # Exit gracefully
}

# Trap the SIGINT (Ctrl + C) signal and call the handler function
trap trap_ctrl_c SIGINT

# Check if xremap is already running
if pgrep -x "xremap" > /dev/null; then
    # If running, try to kill it
    stop_xremap
else
    # If not running, start it
    start_xremap
fi


while true; do
    sleep 1  
done
