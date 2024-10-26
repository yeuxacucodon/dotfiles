#!/usr/bin/env bash

# Install and setup Hyprland
sudo pacman -Syu
sudo pacman -S hyprland hyprpaper --needed
cp ./hypr/ ~/.config/
