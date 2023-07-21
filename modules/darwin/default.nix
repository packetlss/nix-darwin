{ pkgs, ... }: {

  programs.zsh.enable = true;

  environment = {
    shells = [ pkgs.bash pkgs.zsh ];
    loginShell = pkgs.zsh;
    systemPackages = [ pkgs.coreutils ];
    systemPath = [ "/opt/homebrew/bin" ];
    pathsToLink = [ "/Applications" ];
  };

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  nixpkgs.config.allowUnfree = true;

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToControl = true;

  fonts.fontDir.enable = true; # DANGER
  fonts.fonts = [ 
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) 
  ];

  services.nix-daemon.enable = true;

  system.defaults.finder.AppleShowAllExtensions = true;
  system.defaults.finder._FXShowPosixPathInTitle = true;
  system.defaults.finder.ShowPathbar = true;
  system.defaults.finder.ShowStatusBar = true;

  system.defaults.dock.autohide = true;

  system.defaults.NSGlobalDomain.AppleShowAllExtensions = true;
  system.defaults.NSGlobalDomain.InitialKeyRepeat = 15;
  system.defaults.NSGlobalDomain.KeyRepeat = 2;

  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    global.brewfile = true;
    masApps = { 
      "Strongbox - Password Manager" = 897283731;
    };
    casks = [ ];
    taps = [ ];
    brews = [ "mas" ];
    whalebrews = [ ];
  };

  system.stateVersion = 4;
}
