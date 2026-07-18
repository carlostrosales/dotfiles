# Always load bashrc

if [ -f ~/.bashrc ]; then
    # echo "[dotfiles] loading aliases"
    source ~/.bashrc
fi

# echo "[dotfiles] .bashrc loaded"

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
