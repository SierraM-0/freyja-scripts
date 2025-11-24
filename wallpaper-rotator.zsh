#!/usr/bin/env zsh

# Folder containing wallpapers
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# Time in seconds between wallpaper changes
INTERVAL=600

# Make sure the folder exists
if [[ ! -d "$WALLPAPER_DIR" ]]; then
    echo "Folder $WALLPAPER_DIR does not exist."
    exit 1
fi

while true; do
    # Pick a random file from the folder
    file=$(find "$WALLPAPER_DIR" -type f | shuf -n1)
    
    # Encode path safely for GNOME
    uri="file://$(printf '%q' "$file")"

    # Set wallpaper for normal and dark mode
    gsettings set org.gnome.desktop.background picture-uri "$uri"
    gsettings set org.gnome.desktop.background picture-uri-dark "$uri"

    # Wait before changing again
    sleep "$INTERVAL"
done
