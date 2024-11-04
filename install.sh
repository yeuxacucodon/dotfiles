#!/usr/bin/env bash

set -e

CONFIG_DIR="$HOME/.config/"
DRY_RUN=false

# Function to run a command with optional dry run
run_cmd() {
  local cmd="$1"
  if $DRY_RUN; then
    echo "[DRY RUN] $cmd"
  else
    eval "$cmd"
  fi
}

# Ensures the configuration directory exists
ensure_config_dir() {
  [ -d "$CONFIG_DIR" ] || run_cmd "mkdir -p $CONFIG_DIR"
}

# Update system packages
update_system() {
  echo "Updating system packages..."
  run_cmd "sudo pacman -Syu"
}

# Install and configure Hyprland
install_hyprland() {
  echo "Installing and setting up Hyprland..."
  run_cmd "sudo pacman -S hyprland hyprpaper hyprlock --needed"
  ensure_config_dir
  run_cmd "cp -r ./hypr/ $CONFIG_DIR"
}

# Install and configure Neovim
install_neovim() {
  echo "Installing and setting up Neovim..."
  run_cmd "sudo pacman -S neovim --needed"
  ensure_config_dir
  run_cmd "cp -r ./nvim/ $CONFIG_DIR"
}

# Install and configure Rofi
install_rofi() {
  echo "Installing and setting up Rofi..."
  run_cmd "sudo pacman -S rofi-wayland --needed"
  ensure_config_dir
  run_cmd "cp -r ./rofi/ $CONFIG_DIR"
}

install_alacritty() {
  echo "Installing and setting up Alacritty"
  run_cmd "sudo pacman -S alacritty ttf-jetbrains-mono-nerd"
  ensure_config_dir
  run_cmd "cp -r ./alacritty/ $CONFIG_DIR"
}

# Configure Bash
setup_bash() {
  echo "Setting up Bash configuration..."
  run_cmd "cp ./.bashrc ~/"
}

# Install and configure Starship
install_starship() {
  echo "Installing and setting up Starship prompt..."
  run_cmd "sudo pacman -S starship --needed"
  ensure_config_dir
  run_cmd "cp ./starship.toml $CONFIG_DIR"
}

# Install and configure Waybar
install_waybar() {
  echo "Installing and setting up Waybar..."
  run_cmd "sudo pacman -S waybar --needed"
  ensure_config_dir
  run_cmd "cp -r ./waybar/ $CONFIG_DIR"
}

# Install and configure fastfetch
install_fastfetch() {
  echo "Installing and setting up fastfetch"
  run_cmd "sudo pacman -S fastfetch --needed"
  ensure_config_dir
  run_cmd "cp -r ./fastfetch/ $CONFIG_DIR"
}

# Install and setting up yazi
install_yazi() {
  echo "Installing yazi..."
  run_cmd "sudo pacman -S yazi jq ripgrep fd chafa wl-clipboard zoxide fzf ueberzugpp --needed"
  run_cmd "ya pack -i"
  ensure_config_dir
  run_cmd "cp -r ./yazi/ $CONFIG_DIR"
}

# Install backgrounds
install_backgrounds() {
  echo "Installing backgrounds..."
  [ -d "$HOME/Pictures/" ] || run_cmd "mkdir -p $HOME/Pictures/"
  run_cmd "cp -r ./backgrounds/ ~/Pictures/"
}

# Main install function
install() {
  update_system
  install_hyprland
  install_neovim
  install_rofi
  setup_bash
  install_starship
  install_alacritty
  install_waybar
  install_yazi
  install_fastfetch
  install_backgrounds
}

# Help function
show_help() {
  echo "Usage: $0 [OPTION]"
  echo ""
  echo "Options:"
  echo "  --install         Run the full install process to install and configure all applications"
  echo "  --dry-run         Show the commands without executing them (useful for testing)"
  echo "  --help            Display this help message"
  echo ""
}

# Check for arguments
if [ "$#" -eq 0 ]; then
  echo "The script needs arguments. See --help for details."
  exit 1
fi

# Parse arguments
for arg in "$@"; do
  case "$arg" in
  "--install") install ;;
  "--dry-run") DRY_RUN=true ;;
  "--help")
    show_help
    exit 0
    ;;
  *)
    echo "Invalid option: $arg"
    show_help
    exit 1
    ;;
  esac
done
