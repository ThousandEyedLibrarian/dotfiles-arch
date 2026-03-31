#!/bin/bash

player_status=$(playerctl -p spotify status 2>/dev/null)

if [ "$player_status" = "Playing" ] || [ "$player_status" = "Paused" ]; then
    artist=$(playerctl -p spotify metadata artist 2>/dev/null)
    title=$(playerctl -p spotify metadata title 2>/dev/null)
    album=$(playerctl -p spotify metadata album 2>/dev/null)

    if [ -n "$artist" ]; then
        full="$artist - $title"
    elif [ -n "$album" ]; then
        full="$album - $title"
    else
        full="$title"
    fi

    display="$full"
    if [ ${#display} -gt 40 ]; then
        display="${display:0:37}..."
    fi

    if [ "$player_status" = "Paused" ]; then
        class="paused"
        tooltip="$full (Paused)"
    else
        class="playing"
        tooltip="$full"
    fi

    # Escape Pango markup characters so waybar renders text correctly
    escape_pango() { sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g'; }
    display=$(echo "$display" | escape_pango)
    tooltip=$(echo "$tooltip" | escape_pango)

    jq -cn --arg text "  $display" --arg class "$class" --arg tooltip "$tooltip" \
        '{text: $text, class: $class, tooltip: $tooltip}'
else
    echo '{"text": "", "class": "stopped"}'
fi
