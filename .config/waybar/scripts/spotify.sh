#!/bin/bash

player_status=$(playerctl -p spotify status 2>/dev/null)

if [ "$player_status" = "Playing" ]; then
    artist=$(playerctl -p spotify metadata artist 2>/dev/null)
    title=$(playerctl -p spotify metadata title 2>/dev/null)
    display="$artist - $title"
    if [ ${#display} -gt 40 ]; then
        display="${display:0:37}..."
    fi
    echo "{\"text\": \"  $display\", \"class\": \"playing\", \"tooltip\": \"$artist - $title\"}"
elif [ "$player_status" = "Paused" ]; then
    artist=$(playerctl -p spotify metadata artist 2>/dev/null)
    title=$(playerctl -p spotify metadata title 2>/dev/null)
    display="$artist - $title"
    if [ ${#display} -gt 40 ]; then
        display="${display:0:37}..."
    fi
    echo "{\"text\": \"  $display\", \"class\": \"paused\", \"tooltip\": \"$artist - $title (Paused)\"}"
else
    echo "{\"text\": \"\", \"class\": \"stopped\"}"
fi
