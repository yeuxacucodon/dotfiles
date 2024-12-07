#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# Don't repeat yourself
# Good for debug the script
DRY_RUN=false

# Color codes
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
RED='\033[0;31m'
NC='\033[0m'

print_headings() {
	echo -e "$BLUE==> $1$NC"
}

# Run a command
run_command() {
	cmd=$1
	if $DRY_RUN; then
		echo -e "$YELLOW[DRY RUN] $cmd$NC"
	else
		echo -e "$GREEN[RUNNING] $cmd$NC"
		eval $cmd
	fi
}

# Update system
run_command "sudo pacman -Syu"
