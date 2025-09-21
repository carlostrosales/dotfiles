# dotfiles
My Unix dotfiles. Contains my setup for Bash, Neovim, tmux, along with aliases and a single script that can be ran to automatically setup a consistent development environment across macOS, Linux, and WSL.

## about this project
I am here because I went through a rabbit hole of personalizing your system.

It started with the elitist "neovim" setup and configuring lua files, then learning about streamlining your development environment to reduce friction, progressed to "aliases", learning a bit about the Linux file system and why it reigns superior, now I'm here... deep in the terminal. configuring my dotfiles.

I now see the importance and am able to switch between different environments rather that is a new computer, or spinning up a virtual machine. I usually use a UNIX-like system rather that is macOS, linux, or when I am given a windows system I will use WSL with Ubuntu. Now wherever I go, with this repository and a few commands I can bootstrap my environment anywhere.

## key components

- Bootstrap install script -> symlinks, backs up old files automatically.
- Cross-platform support -> works on macOS, Linux, and WSL.
- Custom aliases -> shortcuts for navigation, Git, and system info.
- Startup banner -> lightweight system info (date, OS, battery).
- Neovim config -> clean setup with plugins, theme, and keymaps
- tmux config -> productivity tweaks for terminal multiplexing.

## installation instructions

```bash
git clone https://github.com/your-username/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

Be sure to restart your shell after completing the above steps.

