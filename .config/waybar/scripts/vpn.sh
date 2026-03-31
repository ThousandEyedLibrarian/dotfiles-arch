#!/bin/bash

CACHE_FILE="/tmp/waybar-vpn-country"
CACHE_MAX_AGE=60

if ip link show proton 2>/dev/null | grep -q "UP,LOWER_UP"; then
    # Connected - get country code (cached)
    country=""
    if [[ -f "$CACHE_FILE" ]]; then
        cache_age=$(( $(date +%s) - $(stat -c %Y "$CACHE_FILE") ))
        if (( cache_age < CACHE_MAX_AGE )); then
            country=$(cat "$CACHE_FILE")
        fi
    fi

    if [[ -z "$country" ]]; then
        country=$(curl -s --max-time 3 https://ipinfo.io/country 2>/dev/null)
        if [[ -n "$country" && ${#country} -eq 2 ]]; then
            echo "$country" > "$CACHE_FILE"
        else
            country=$(cat "$CACHE_FILE" 2>/dev/null || echo "??")
        fi
    fi

    echo "{\"text\": \"󰒃 ${country}\", \"class\": \"connected\", \"tooltip\": \"ProtonVPN connected (${country})\"}"
else
    # Disconnected
    rm -f "$CACHE_FILE"
    echo "{\"text\": \"󰌾 --\", \"class\": \"disconnected\", \"tooltip\": \"ProtonVPN disconnected\"}"
fi
