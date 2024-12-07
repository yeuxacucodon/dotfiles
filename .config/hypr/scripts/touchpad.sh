#!/usr/bin/env bash

# Device and variable names for Hyprland touchpad configuration
HYPRLAND_DEVICE="asuf1203:00-2808:0217-touchpad"
HYPRLAND_VARIABLE="device[$HYPRLAND_DEVICE]:enabled"
TOUCHPAD_STATUS="$HOME/.cache/touchpad_status"

# Enable touchpad function
enable_touchpad() {
  echo true >"$TOUCHPAD_STATUS"
  dunstify "Touchpad enabled" || echo "Failed to send notification"
  hyprctl keyword "$HYPRLAND_VARIABLE" true || echo "Failed to enable touchpad"
}

# Disable touchpad function
disable_touchpad() {
  echo false >"$TOUCHPAD_STATUS"
  dunstify -u normal "Touchpad disabled" || echo "Failed to send notification"
  hyprctl keyword "$HYPRLAND_VARIABLE" false || echo "Failed to disable touchpad"
}

# Check touchpad status and toggle accordingly
if [ ! -f "$TOUCHPAD_STATUS" ]; then
  enable_touchpad
else
  case "$(cat "$TOUCHPAD_STATUS")" in
  true) disable_touchpad ;;
  false) enable_touchpad ;;
  *) echo "Unknown status; resetting to enabled" && enable_touchpad ;;
  esac
fi
