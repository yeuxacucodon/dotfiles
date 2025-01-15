# Disable fish greeting message
set -g fish_greeting

# Enable zoxide integration
zoxide init fish | source

# Enable fzf integration
fzf --fish | source

# Enable starship integration for fish
starship init fish | source

# Aliases
alias ls="eza --group-directories-first --header --icons=auto --git --color=auto"
alias ll="ls -l"
alias la="ls -a"
alias lt="ls --tree"
alias lla="ls -la"
alias gs="git status"
alias gc="git commit"
set -x EDITOR nvim
