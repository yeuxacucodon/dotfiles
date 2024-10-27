#!/usr/bin/env bash

# Update system
sudo pacman -Syu

# Install and setup Hyprland
sudo pacman -S hyprland hyprpaper hyprlock --needed
cp ./hypr/ ~/.config/

# Install and setup Neovim
sudo pacman -S neovim
cp -r ./nvim/ ~/.config/

# Install and setup rofi
sudo pacman -S rofi-wayland
cp -r ./rofi/ ~/.config/
