#!/usr/bin/env bash
set -e

# Define dotfiles root
DOTFILES=$HOME/dotfiles

# Detect operating system
echo "Bootstrapping environment..."

# Installs git, neovim, tmux via package manager
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "macOS detected"
    if ! command -v brew &>/dev/null; then
        echo "Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        # Make brew available in THIS script run
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    brew install git neovim tmux fastfetch || true

elif [[ -f /etc/debian_version ]]; then
    echo "Debian/Ubuntu detected"
    sudo apt update
    sudo apt install -y git neovim tmux curl build-essential fastfetch || sudo apt install -y neofetch

elif [[ -f /etc/redhat-release ]]; then
    echo "Redhat/Fedora detected"
    sudo dnf install -y git neovim tmux curl fastfetch || sudo dnf install -y neofetch
else
    echo "Unsupported OS: $OSTYPE"
fi

# Symlinks
echo "Linked dotfiles..."

# Helper function that backs up existing dotfiles and symlinks repo-managed ones into $HOME
link_file() {
	local src=$1
	local dest=$2
	
	if [ -e "$dest" ] || [ -L "$dest" ]; then
		local backup="${dest}.backup.$(date + "%Y%m%d%H%M%S")"
		echo "Backing up existing $dest -> $backup"
		mv "$dest" "$backup"
	fi

	echo "Linking $dest -> $src"
	ln -s "$src" "$dest"
}

echo "Linking dotfiles..."

# --- Core dotfiles ---
link_file "$DOTFILES/bash/.bashrc" "$HOME/.bashrc"
link_file "$DOTFILES/bash/.bash_profile" "$HOME/.bash_profile"
link_file "$DOTFILES/common/.aliases.sh" "$HOME/.aliases"
link_file "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"
link_file "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"

# --- Neovim config ---
mkdir -p ~/.config
link_file "$DOTFILES/.nvim" "$HOME/.config/nvim"

echo "Setup complete! Restart your shell."

