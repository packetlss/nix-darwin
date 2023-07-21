{ pkgs, ... }: {

  home.stateVersion = "23.05";

  nixpkgs.config.allowUnfree = true;

  # specify my home-manager configs
  home.packages = [ 
    pkgs.ripgrep
    pkgs.fd
    pkgs.curl
    pkgs.less
    pkgs.vim
  ];

  home.sessionVariables = {
    PAGER = "less";
    CLICLOLOR = 1;
    EDITOR = "vim";
  };

  #programs.home-manager.enable = true;

  #programs.bat.enable = true;
  #programs.bat.config.theme = "TwoDark";
  #programs.fzf.enable = true;
  #programs.fzf.enableZshIntegration = true;
  #programs.exa.enable = true;

  programs.git = {
    enable = true;
    userName = "Magnus Eriksson";
    userEmail = "packetlss@gmail.com";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };

  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.enableAutosuggestions = true;
  programs.zsh.syntaxHighlighting.enable = true;
  programs.zsh.shellAliases = { 
    ls = "ls --color=auto -F";
  };
  programs.starship.enable = true;
  programs.starship.enableZshIntegration = true;

  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''
      -- Your lua code / config here
      return {
        font = wezterm.font("JetBrains Mono"),
        font_size = 14.0,
        keys = {
          { key="n", mods="SHIFT|CTRL", action="ToggleFullScreen" },
        }              
      }
    '';
  };

  home.file.".inputrc".source = ./dotfiles/inputrc;

}
