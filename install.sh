#!/usr/bin/env bash

bootstrap() {
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

  # Setup Bash
  cp ./.bashrc ~/

  # Install and setup starship
  sudo pacman -S starship
  cp ./starship.toml ~/.config/

  # Install and setup waybar
  sudo pacman -S waybar
  cp ./waybar/ ~/.config/
}

case "$1" in
"--bootstrap")
  bootstrap
  ;;
esac
