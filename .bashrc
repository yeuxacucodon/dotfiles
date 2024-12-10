#
# ~/.bashrc
#

# Exit early if the shell is not interactive
[[ $- != *i* ]] && return

# Aliases for common commands
alias ls="eza --group-directories-first --header --icons=auto --git --color=auto"
alias ll="ls -l"             # Long listing format
alias la="ls -a"             # Show hidden files
alias lt="ls --tree"         # Display directories as a tree
alias lla="ls -la"           # Long listing including hidden files
alias grep="rg --color=auto" # Use ripgrep for search with color output
alias open="xdg-open"        # Open files with the default application
alias ..="cd .."             # Go up one directory
alias ...="cd ../.."         # Go up two directories
alias gs="git status"        # Git status shortcut
alias gc="git commit"        # Git commit shortcut

# Set default editor to Neovim
export EDITOR="nvim"

# Initialize zoxide (smart directory jumping)
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init bash)"
fi

# Initialize fzf (fuzzy finder)
if command -v fzf &>/dev/null; then
  eval "$(fzf --bash)"
fi

# Improve command history
export HISTSIZE=10000                        # Increase number of commands in memory
export HISTFILESIZE=20000                    # Increase number of commands in .bash_history
export HISTCONTROL=ignoreboth:erasedups      # Ignore duplicates and commands starting with a space
shopt -s histappend                          # Append to history file instead of overwriting
PROMPT_COMMAND="history -a; $PROMPT_COMMAND" # Save history after each command

# Check the window size after each command
shopt -s checkwinsize

# Enable recursive globbing (e.g., **/*.txt)
shopt -s globstar

# Enhance PATH with user binaries
export PATH="$HOME/.local/bin:$HOME/.local/share/bob/nvim-bin:$PATH"

# Enable Node.js completion if available
if command -v node &>/dev/null; then
  eval "$(node --completion-bash)"
fi

# Initialize Starship prompt
if command -v starship &>/dev/null; then
  eval "$(starship init bash)"
else
  PS1="\[\e[32m\]\u@\h:\[\e[34m\]\w\[\e[m\] \$ " # PS1 fallback if starship not found
fi

# Quickly extract archives
extract() {
  if [ -f "$1" ]; then
    case "$1" in
    *.tar.bz2) tar xjf "$1" ;;
    *.tar.gz) tar xzf "$1" ;;
    *.tar.xz) tar xf "$1" ;;
    *.bz2) bunzip2 "$1" ;;
    *.rar) unrar x "$1" ;;
    *.gz) gunzip "$1" ;;
    *.tar) tar xf "$1" ;;
    *.tbz2) tar xjf "$1" ;;
    *.tgz) tar xzf "$1" ;;
    *.zip) unzip "$1" ;;
    *.Z) uncompress "$1" ;;
    *.7z) 7z x "$1" ;;
    *) echo "'$1' cannot be extracted" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
