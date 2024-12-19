#!/bin/sh

# Paths
PYWAL_COLORS_PATH="$HOME/.cache/wal/colors.json"
ROFI_CONFIG_PATH="$HOME/.config/rofi/launchers/type-6/style-2.rasi"

# Check if colors.json exists
if [ ! -f "$PYWAL_COLORS_PATH" ]; then
    echo "Error: $PYWAL_COLORS_PATH not found."
    exit 1
fi

# Load values from colors.json
BACKGROUND=$(jq -r '.colors.color0' "$PYWAL_COLORS_PATH")
FOREGROUND=$(jq -r '.colors.color7' "$PYWAL_COLORS_PATH")
SELECTED=$(jq -r '.colors.color1' "$PYWAL_COLORS_PATH")
BORDER=$(jq -r '.colors.color2' "$PYWAL_COLORS_PATH")
ALTERNATE=$(jq -r '.colors.color3' "$PYWAL_COLORS_PATH")
URGENT=$(jq -r '.colors.color4' "$PYWAL_COLORS_PATH")
WALLPAPER=$(jq -r '.wallpaper' "$PYWAL_COLORS_PATH")

# Function to update or insert styles in the Rofi configuration
update_or_insert_style() {
    local key="$1"
    local value="$2"
    # Escape special characters for sed
    value=$(echo "$value" | sed -e 's/[&/]/\\&/g')
    if grep -q "^[[:space:]]*${key}:" "$ROFI_CONFIG_PATH"; then
        # Update the existing key
        sed -i "s|^[[:space:]]*${key}:.*$|    ${key}: ${value};|" "$ROFI_CONFIG_PATH"
    else
        # Add the key to the Global Properties section
        sed -i "/\* {/,/^}/ s/^}/    ${key}: ${value};\n}/" "$ROFI_CONFIG_PATH"
    fi
}

# Update the Rofi configuration with Pywal colors
update_or_insert_style "background" "$BACKGROUND"
update_or_insert_style "background-alt" "$BACKGROUND"
update_or_insert_style "foreground" "$FOREGROUND"
update_or_insert_style "selected" "$SELECTED"
update_or_insert_style "border" "$BORDER"
update_or_insert_style "alternate" "$ALTERNATE"
update_or_insert_style "urgent" "$URGENT"
update_or_insert_style "background-image" "url(\"${WALLPAPER}\", height)"

# Notify user of success
echo "Rofi configuration updated with Pywal colors and wallpaper."
