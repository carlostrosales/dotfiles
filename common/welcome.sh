#!/usr/bin/env bash
# --- Universal Dotfiels Welcome Script ---


# Detect OS
case "$(uname -s)" in
	Darwin) DOTFILES_OS="macOS" ;;
	Linux)
		if grep -qEi "(Microsoft|WSL)" /proc/version &> /dev/null; then
			DOTFILES_OS="WSL"
		else
			DOTFILES_OS="Linux"
		fi ;;
	*)		DOTFILES_OS="Other" ;;
esac
export DOTFILES_OS

# Show welcome info
if command -v neofetch &> /dev/null; then
	neofetch
else
	echo "Welcome to $DOTFILES_OS, $(whoami)!"
	echo "Today is $(date)"
fi

# Example per-OS aliases
if [[ "$DOTFILES_OS" == "macOS" ]]; then
	alias ls="ls -G"
elif [[ "$DOTFILES_OS" == "Linux" ]]; then
	alias ls="ls --color=auto"
elif [[ "$DOTFILES_OS" == "WSL" ]]; then
	alias explorer="explorer.exe"
fi
