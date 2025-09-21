# Navigation
alias ..="cd .."
alias ..."cd ../.."

# Git
alias gs="git status"
alias gl="git log --oneline --graph --decorate"
alias gcd="git checkout development"
alias gp="git pull"
alias gc="git commit -m"

# Docker
alias dcu="docker compose up"
alias dcd="docker compose up"

# Shortcuts
alias v="nvim"
alias please="sudo $(fc -ln -1)"

# System Checks
alias ports="lsof -i -P -n | grep LISTEN" # show open ports
alias disk="df -h"
alias mem="vm_stat"
alias cpu="top -l 1 | head -n 10"


