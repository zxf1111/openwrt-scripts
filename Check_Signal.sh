#!/usr/bin/zsh

# Function to handle cleanup on exit
cleanup() {
    echo "Cleaning up..."
    exit 0
}

# Trap SIGINT (Ctrl + C) to call the cleanup function
trap cleanup SIGINT

# Output initial message
echo -n "Signal Strength: "

while true; do
    # Get the signal information and extract the signal strength
    signal_info=$(iwinfo phy0-sta0 info | grep Sig)
    
    # Move the cursor to the beginning of the line and clear the line
    echo -ne "\rSignal Strength: $signal_info"
    
    # Pause for 0.3 seconds
    sleep 0.3
done

