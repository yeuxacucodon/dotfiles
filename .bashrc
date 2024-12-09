#
# ~/.bashrc
#

# Exit early if the shell is not interactive
[[ $- != *i* ]] && return

# Initialize Starship prompt
eval "$(starship init bash)"

# Aliases for common commands
alias ls="eza --group-directories-first --header --icons=auto --git --color=auto"
alias ll="ls -l"             # Long listing format
alias la="ls -a"             # Show hidden files
alias lt="ls --tree"         # Display directories as a tree
alias lla="ls -la"           # Long listing including hidden files
alias grep="rg --color=auto" # Use ripgrep for search with color output
alias open="xdg-open"        # Open files with the default application

# Set default editor to Neovim
export EDITOR="nvim"

# Initialize zoxide (smart directory jumping)
eval "$(zoxide init bash)"

# Initialize fzf (fuzzy finder)
eval "$(fzf --bash)"

# Improve command history
export HISTSIZE=5000                         # Number of commands to keep in memory
export HISTFILESIZE=10000                    # Number of commands to keep in .bash_history
export HISTCONTROL=ignoredups:erasedups      # Avoid duplicate entries
shopt -s histappend                          # Append to history file instead of overwriting
PROMPT_COMMAND="history -a; $PROMPT_COMMAND" # Save history after each command

# Checks the window size after each command and, if necessary, updates the values of LINES and COLUMNS.
shopt -s checkwinsize

export PATH="$PATH:$HOME/.local/share/bob/nvim-bin"
