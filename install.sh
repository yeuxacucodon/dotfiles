#!/usr/bin/env bash

set -e

CONFIG_DIR="$HOME/.config/"
DRY_RUN=false

# Color codes
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to print headings
print_heading() {
  echo -e "${BLUE}==> ${1}${NC}"
}

# Function to run a command with optional dry run
run_cmd() {
  local cmd="$1"
  if $DRY_RUN; then
    echo -e "${YELLOW}[DRY RUN] $cmd${NC}"
  else
    echo -e "${GREEN}[RUNNING] $cmd${NC}"
    eval "$cmd"
  fi
}

# Ensures the configuration directory exists
ensure_config_dir() {
  [ -d "$CONFIG_DIR" ] || run_cmd "mkdir -p $CONFIG_DIR"
}

# Update system packages
update_system() {
  print_heading "Updating system packages..."
  run_cmd "sudo pacman -Syu"
}

# Install and configure Hyprland
install_hyprland() {
  print_heading "Installing and setting up Hyprland..."
  run_cmd "sudo pacman -S hyprland hyprpaper hyprlock --needed"
  ensure_config_dir
  run_cmd "cp -r ./hypr/ $CONFIG_DIR"
}

# Install and configure Neovim
install_neovim() {
  print_heading "Installing and setting up Neovim..."
  run_cmd "sudo pacman -S neovim --needed"
  ensure_config_dir
  run_cmd "cp -r ./nvim/ $CONFIG_DIR"
}

# Install and configure Rofi
install_rofi() {
  print_heading "Installing and setting up Rofi..."
  run_cmd "sudo pacman -S rofi-wayland --needed"
  ensure_config_dir
  run_cmd "cp -r ./rofi/ $CONFIG_DIR"
}

# Install and configure Alacritty
install_alacritty() {
  print_heading "Installing and setting up Alacritty..."
  run_cmd "sudo pacman -S alacritty ttf-jetbrains-mono-nerd --needed"
  ensure_config_dir
  run_cmd "cp -r ./alacritty/ $CONFIG_DIR"
}

# Configure Bash
setup_bash() {
  print_heading "Setting up Bash configuration..."
  run_cmd "cp ./.bashrc ~/"
}

# Install and configure Starship
install_starship() {
  print_heading "Installing and setting up Starship prompt..."
  run_cmd "sudo pacman -S starship --needed"
  ensure_config_dir
  run_cmd "cp ./starship.toml $CONFIG_DIR"
}

# Install and configure Waybar
install_waybar() {
  print_heading "Installing and setting up Waybar..."
  run_cmd "sudo pacman -S waybar --needed"
  ensure_config_dir
  run_cmd "cp -r ./waybar/ $CONFIG_DIR"
}

# Install and configure fastfetch
install_fastfetch() {
  print_heading "Installing and setting up fastfetch..."
  run_cmd "sudo pacman -S fastfetch --needed"
  ensure_config_dir
  run_cmd "cp -r ./fastfetch/ $CONFIG_DIR"
}

# Install and setting up yazi
install_yazi() {
  print_heading "Installing yazi and related tools..."
  run_cmd "sudo pacman -S yazi jq ripgrep fd chafa wl-clipboard zoxide fzf ueberzugpp --needed"
  run_cmd "ya pack -i"
  ensure_config_dir
  run_cmd "cp -r ./yazi/ $CONFIG_DIR"
}

# Install and setting up dunst
install_dunst() {
  print_heading "Installing and setting up dunst..."
  run_cmd "sudo pacman -S dunst --needed"
  ensure_config_dir
  run_cmd "cp -r ./dunst/ $CONFIG_DIR"
}

# Install and setting up Nix
install_nix() {
  print_heading "Installing and setting up Nix..."
  run_cmd "sudo pacman -S nix --needed"
  ensure_config_dir
  run_cmd "cp -r ./nix/ $CONFIG_DIR"
}

# Install and setting up bottom
install_bottom() {
  print_heading "Installing and setting up bottom"
  run_cmd "sudo pacman -S bottom --needed"
  ensure_config_dir
  run_cmd "cp -r ./bottom/ $CONFIG_DIR"
}

# Install backgrounds
install_backgrounds() {
  print_heading "Installing backgrounds..."
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
  install_dunst
  install_alacritty
  install_waybar
  install_yazi
  install_fastfetch
  install_backgrounds
}

# Help function
show_help() {
  echo -e "${BLUE}Usage:${NC} $0 [OPTION]"
  echo ""
  echo "Options:"
  echo -e "  ${YELLOW}--install${NC}         Run the full install process to install and configure all applications"
  echo -e "  ${YELLOW}--dry-run${NC}         Show the commands without executing them (useful for testing)"
  echo -e "  ${YELLOW}--help${NC}            Display this help message"
  echo ""
}

# Check for arguments
if [ "$#" -eq 0 ]; then
  echo -e "${RED}Error:${NC} The script needs arguments. See --help for details."
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
    echo -e "${RED}Invalid option:${NC} $arg"
    show_help
    exit 1
    ;;
  esac
done
