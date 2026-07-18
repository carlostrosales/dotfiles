{ user, ... }:

{
  # Determinate already manages the Nix daemon, so nix-darwin shouldn't.
  nix.enable = false;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin"; # use x86_64-darwin for Intel CPU

  system.primaryUser = user;
  users.users.${user} = {
    home = "/Users/${user}";
  };
  system.stateVersion = 6;
  system.defaults = {
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      KeyRepeat = 2;          # fast key repeat
      InitialKeyRepeat = 15;  # short delay before repeat
      _HIHideMenuBar = true;  # auto-hide the menu bar
      AppleShowAllExtensions = true;
    };
    dock.autohide = true;
    finder.FXPreferredViewStyle = "Nlsv";  # list view by default
    finder.CreateDesktop = false;          # clean desktop
    trackpad.Clicking = true;              # tap to click
  };
  nix-homebrew = {
    enable = true;
    inherit user;
    autoMigrate = true;  # adopt the existing /opt/homebrew install, keeping its packages
  };
  homebrew = {
    enable = true;
    # "none" for the first migration so no existing package/data is removed.
    # Once you rebuild and confirm everything below survived, switch to "zap"
    # to enforce that only what's listed here stays installed.
    onActivation.cleanup = "none";
    onActivation.autoUpdate = true;
    onActivation.extraFlags = [ "--force" ];
    brews = [
      # Existing packages (from `brew leaves`), declared so cleanup won't remove them.
      "black"
      "fastfetch"
      "gh"
      "git"
      "git-filter-repo"
      "go"
      "htop"
      "maven"
      "neovim"
      "node"
      "openjdk@21"
      "pgvector"
      "pgxnclient"
      "pipx"
      "pnpm"
      "postgresql@16"
      "ripgrep"
      "tmux"
      "wget"
      # Added via Nix
      "herdr"
    ];
    casks = [
      # Existing casks
      "aerospace"
      "ngrok"
      "stats"
      "tailscale-app"
      # Added via Nix
      "wezterm"
      "claude-code"
    ];
  };
}
