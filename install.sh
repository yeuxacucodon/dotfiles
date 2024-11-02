#!/usr/bin/env bash

bootstrap() {
  # Update system
  sudo pacman -Syu

  # Install and setup Hyprland
  sudo pacman -S hyprland hyprpaper hyprlock --needed
  cp -r ./hypr/ ~/.config/

  # Install and setup Neovim
  sudo pacman -S neovim --needed
  cp -r ./nvim/ ~/.config/

  # Install and setup rofi
  sudo pacman -S rofi-wayland --needed
  cp -r ./rofi/ ~/.config/

  # Setup Bash
  cp ./.bashrc ~/

  # Install and setup starship
  sudo pacman -S starship --needed
  cp ./starship.toml ~/.config/

  # Install and setup waybar
  sudo pacman -S waybar --needed
  cp -r ./waybar/ ~/.config/
}

case "$1" in
"--bootstrap")
  bootstrap
  ;;
esac
