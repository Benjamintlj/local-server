#!/bin/bash

# Set system volume to level 3
osascript -e "set volume 3"

# Function to play music
play_music() {
    afplay -v 1 -t 46 /Users/benjaminlewis-jones/Documents/Projects/scripts/local-server/lib/HELLDIVERS.mp3
}

# Function to open and resize Discord
setup_discord() {
    open -a "Discord"
    sleep 5
    osascript -e '
    tell application "System Events"
        tell application process "Discord"
            repeat until exists window 1
                delay 0.5
            end repeat
            tell window 1
                -- Adjust the position coordinates to match your external monitor
                set position to {-1080, -1020} -- Calculated based on laptop screen height
                set size to {1080, 1920}
            end tell
        end tell
    end tell
    '
}

# Run both functions in parallel
play_music &
setup_discord &

wait