#!/usr/bin/env bash

# Update system
sudo pacman -Syu

# Install and setup Hyprland
sudo pacman -S hyprland hyprpaper --needed
cp ./hypr/ ~/.config/

# Install and setup Neovim
sudo pacman -S neovim
cp -r ./nvim/ ~/.config/
