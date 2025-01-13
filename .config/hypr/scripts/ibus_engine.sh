#!/usr/bin/env bash

choice=$(echo -e "BambooUs\nBamboo::Us" | fzf --prompt "Engine: ")
ibus engine "$choice"
