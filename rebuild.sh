#!/usr/bin/env bash
set -euo pipefail

exec sudo nix run nix-darwin -- switch --flake "$HOME/.dotfiles#mac"
