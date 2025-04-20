{userConfig, ...}: {

  programs = {
    zsh = {
      # create /etc/zshrc that loads the nix-darwin environment,
      # required if you want to use darwin's default shell - zsh
      enable = true;
      enableCompletion = true;
      dotDir = "$userConfig.homeDirectory/.config/zsh";
    };
  };

  home.file = {
    "${userConfig.homeDirectory}/.config/zsh" = {
      enable = true;
      source = ./files;
      recursive = true;
    };
  };

}

