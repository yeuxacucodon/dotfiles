#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Use starship promt
eval "$(starship init bash)"

# Aliases
alias ls="eza --group-directories-first --header --icons=auto --git --color=auto"
alias ll="ls -l"
alias la="ls -a"
alias lt="ls --tree"
alias lla="ls -la"
alias grep="rg --color=auto"
alias open="xdg-open"

# Use zoxide
eval "$(zoxide init bash)"

# Use fzf
eval "$(fzf --bash)"
