#!/bin/sh

# Paths
PYWAL_COLORS_PATH="$HOME/.cache/wal/colors.json"
SPICETIFY_CONFIG_PATH="/home/beafowl/.config/spicetify/Themes/Comfy/color.ini"

# Check if colors.json exists
if [ ! -f "$PYWAL_COLORS_PATH" ]; then
    echo "Error: $PYWAL_COLORS_PATH not found."
    exit 1
fi

# Load values from colors.json without #
TEXT=$(jq -r '.colors.color15' "$PYWAL_COLORS_PATH" | sed 's/#//')
SUBTEXT=$(jq -r '.colors.color7' "$PYWAL_COLORS_PATH" | sed 's/#//')
MAIN=$(jq -r '.colors.color0' "$PYWAL_COLORS_PATH" | sed 's/#//')
MAIN_ELEVATED=$(jq -r '.colors.color1' "$PYWAL_COLORS_PATH" | sed 's/#//')
MAIN_TRANSITION=$(jq -r '.colors.color0' "$PYWAL_COLORS_PATH" | sed 's/#//')
HIGHLIGHT=$(jq -r '.colors.color5' "$PYWAL_COLORS_PATH" | sed 's/#//')
HIGHLIGHT_ELEVATED=$(jq -r '.colors.color13' "$PYWAL_COLORS_PATH" | sed 's/#//')
SIDEBAR=$(jq -r '.colors.color0' "$PYWAL_COLORS_PATH" | sed 's/#//')
PLAYER=$(jq -r '.colors.color0' "$PYWAL_COLORS_PATH" | sed 's/#//')
CARD=$(jq -r '.colors.color0' "$PYWAL_COLORS_PATH" | sed 's/#//')
SHADOW=$(jq -r '.colors.color8' "$PYWAL_COLORS_PATH" | sed 's/#//')
SELECTED_ROW=$(jq -r '.colors.color15' "$PYWAL_COLORS_PATH" | sed 's/#//')
BUTTON=$(jq -r '.colors.color6' "$PYWAL_COLORS_PATH" | sed 's/#//')
BUTTON_ACTIVE=$(jq -r '.colors.color14' "$PYWAL_COLORS_PATH" | sed 's/#//')
BUTTON_DISABLED=$(jq -r '.colors.color8' "$PYWAL_COLORS_PATH" | sed 's/#//')
TAB_ACTIVE=$(jq -r '.colors.color0' "$PYWAL_COLORS_PATH" | sed 's/#//')
NOTIFICATION="FFFFFF"
NOTIFICATION_ERROR="D25050"
MISC=$(jq -r '.colors.color0' "$PYWAL_COLORS_PATH" | sed 's/#//')
PLAY_BUTTON=$(jq -r '.colors.color3' "$PYWAL_COLORS_PATH" | sed 's/#//')
PLAY_BUTTON_ACTIVE=$(jq -r '.colors.color11' "$PYWAL_COLORS_PATH" | sed 's/#//')
PROGRESS_FG=$(jq -r '.colors.color10' "$PYWAL_COLORS_PATH" | sed 's/#//')
PROGRESS_BG=$(jq -r '.colors.color0' "$PYWAL_COLORS_PATH" | sed 's/#//')
HEART=$(jq -r '.colors.color12' "$PYWAL_COLORS_PATH" | sed 's/#//')
PAGELINK_ACTIVE=$(jq -r '.colors.color3' "$PYWAL_COLORS_PATH" | sed 's/#//')
RADIO_BTN_ACTIVE=$(jq -r '.colors.color3' "$PYWAL_COLORS_PATH" | sed 's/#//')

# Function to update or insert styles in the Spicetify configuration
update_or_insert_style() {
    local key="$1"
    local value="$2"
    # Escape special characters for sed
    value=$(echo "$value" | sed -e 's/[&/]/\\&/g')
    if grep -q "^[[:space:]]*${key}[[:space:]]*=" "$SPICETIFY_CONFIG_PATH"; then
        # Replace the existing key, trimming spaces around the key
        sed -i "s|^[[:space:]]*${key}[[:space:]]*=.*$|${key} = ${value}|" "$SPICETIFY_CONFIG_PATH"
    else
        # Add the key under the [Comfy] section
        sed -i "/\[Comfy\]/a ${key} = ${value}" "$SPICETIFY_CONFIG_PATH"
    fi
}

# Ensure [Comfy] section exists
if ! grep -q "\[Comfy\]" "$SPICETIFY_CONFIG_PATH"; then
    echo "[Comfy]" >> "$SPICETIFY_CONFIG_PATH"
fi

# Update the Spicetify configuration with Pywal colors
update_or_insert_style "text" "$TEXT"
update_or_insert_style "subtext" "$SUBTEXT"
update_or_insert_style "main" "$MAIN"
update_or_insert_style "main-elevated" "$MAIN_ELEVATED"
update_or_insert_style "main-transition" "$MAIN_TRANSITION"
update_or_insert_style "highlight" "$HIGHLIGHT"
update_or_insert_style "highlight-elevated" "$HIGHLIGHT_ELEVATED"
update_or_insert_style "sidebar" "$SIDEBAR"
update_or_insert_style "player" "$PLAYER"
update_or_insert_style "card" "$CARD"
update_or_insert_style "shadow" "$SHADOW"
update_or_insert_style "selected-row" "$SELECTED_ROW"
update_or_insert_style "button" "$BUTTON"
update_or_insert_style "button-active" "$BUTTON_ACTIVE"
update_or_insert_style "button-disabled" "$BUTTON_DISABLED"
update_or_insert_style "tab-active" "$TAB_ACTIVE"
update_or_insert_style "notification" "$NOTIFICATION"
update_or_insert_style "notification-error" "$NOTIFICATION_ERROR"
update_or_insert_style "misc" "$MISC"
update_or_insert_style "play-button" "$PLAY_BUTTON"
update_or_insert_style "play-button-active" "$PLAY_BUTTON_ACTIVE"
update_or_insert_style "progress-fg" "$PROGRESS_FG"
update_or_insert_style "progress-bg" "$PROGRESS_BG"
update_or_insert_style "heart" "$HEART"
update_or_insert_style "pagelink-active" "$PAGELINK_ACTIVE"
update_or_insert_style "radio-btn-active" "$RADIO_BTN_ACTIVE"

# Notify user of success
echo "Spicetify configuration updated with Pywal colors."
