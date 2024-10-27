#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='eza --icons=auto'
alias la='eza -a'
alias ll='eza -l'
alias tree='eza -T'

# Integrate starship
eval "$(starship init bash)"

# Start ssh-agent automatically
if ! pgrep -u "$USER" ssh-agent >/dev/null; then
  ssh-agent -t 1h >"$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
  source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# Integrate fzf
eval "$(fzf --bash)"
