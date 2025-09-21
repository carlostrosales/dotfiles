# Load shared configs
for file in ~/dotfiles/common/*.sh; do
    [ -r "$file" ] && source "$file"
done

echo "[dotfiles] .bashrc loaded"

shopt -s expand_aliases  # ensure aliases expand in all shells

# Load aliases if available
if [ -f ~/.aliases ]; then
	echo "[dotfiles] loading aliases"
	source ~/.aliases
fi

# Homebrew / Linuxbrew
if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Optional: system info banner
if command -v fastfetch &>/dev/null; then
	fastfetch
elif command -v neofetch &>/dev/null; then
	neofetch
else
	echo "Welcome to $(uname -s), $USER!"
	echo "Today is $(date)"
fi
