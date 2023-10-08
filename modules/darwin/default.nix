{ pkgs, ... }: {

  programs.zsh.enable = true;

  environment = {
    shells = [ pkgs.bash pkgs.zsh ];
    loginShell = pkgs.zsh;
    systemPackages = [ pkgs.coreutils ];
    systemPath = [ "/opt/homebrew/bin" ];
    pathsToLink = [ "/Applications" ];
  };


  networking.computerName = "Plutten MacBook";
  networking.hostName = "plutten";


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

  security.pam.enableSudoTouchIdAuth = true;


  system.defaults.finder = {
    AppleShowAllExtensions = true;
    _FXShowPosixPathInTitle = true;
    ShowPathbar = false;
    ShowStatusBar = true;
    FXPreferredViewStyle = "Nlsv";
  };

  system.defaults.dock.autohide = true;

  system.defaults.loginwindow.GuestEnabled = false;

  system.defaults.NSGlobalDomain.AppleInterfaceStyle = "Dark";
  system.defaults.NSGlobalDomain.AppleShowAllExtensions = true;
  system.defaults.NSGlobalDomain.InitialKeyRepeat = 15;
  system.defaults.NSGlobalDomain.KeyRepeat = 2;

  system.defaults.NSGlobalDomain.NSAutomaticCapitalizationEnabled = false;
  system.defaults.NSGlobalDomain.NSAutomaticDashSubstitutionEnabled = false;
  system.defaults.NSGlobalDomain.NSAutomaticPeriodSubstitutionEnabled = false;
  system.defaults.NSGlobalDomain.NSAutomaticQuoteSubstitutionEnabled = false;
  system.defaults.NSGlobalDomain.NSAutomaticSpellingCorrectionEnabled = false;

  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    global.brewfile = true;
    masApps = { 
      "Strongbox - Password Manager" = 897283731;
    };
    casks = [ "obsidian" "gqrx" "tabby" ];
    taps = [ ];
    brews = [ "mas" ];
    whalebrews = [ ];
  };

  #time.timeZone = "Europe/Stockholm";

  system.stateVersion = 4;
}
