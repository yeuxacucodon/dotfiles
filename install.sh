#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -euo pipefail

# Enable color output only if supported
if [[ -t 1 ]]; then
  GREEN='\033[0;32m'
  BLUE='\033[1;34m'
  NC='\033[0m'
else
  GREEN=''
  BLUE=''
  NC=''
fi

# Print section headings
print_headings() {
  echo -e "${BLUE}==> $1${NC}"
}

# Run a command and print status
run_command() {
  local cmd="$1"

  if [[ -z "$cmd" ]]; then
    echo -e "${GREEN}[SKIPPED] Empty command${NC}"
    return 0
  fi

  echo -e "${GREEN}[RUNNING] $cmd${NC}"
  eval "$cmd"
}

# Update system
print_headings "Updating system packages"
run_command "sudo pacman -Syu"

# Define packages to install
PACKAGES=(
  # Window manager and utilities
  hyprland hyprlock waybar nwg-look alacritty

  # Fonts
  ttf-jetbrains-mono-nerd ttf-roboto

  # Terminal utilities
  fd zoxide yazi stow neovim vim lazygit btop fastfetch starship

  # Shell and Git
  fish git ripgrep fzf
)

# Install necessary packages
print_headings "Installing necessary packages"
run_command "sudo pacman -S ${PACKAGES[*]} --needed"

# Stow configuration files
print_headings "Applying dotfiles with stow"
if command -v stow &>/dev/null && [[ -n "$(ls -A . 2>/dev/null)" ]]; then
  run_command "stow --adopt ."
else
  echo -e "${GREEN}[SKIPPED] No files to stow or stow not installed${NC}"
fi

# Final message
echo -e "${GREEN}All tasks completed successfully!${NC}"
