{userConfig, ...}: {

  home.file = {
    "${userConfig.homeDirectory}/.config/ghostty" = {
      enable = true;
      source = ./ghostty;
      recursive = true;
    };
    "${userConfig.homeDirectory}/.config/oh-my-posh" = {
      enable = true;
      source = ./oh-my-posh;
      recursive = true;
    };
    "${userConfig.homeDirectory}/.config/pistol" = {
      enable = true;
      source = ./pistol;
      recursive = true;
    };
    "${userConfig.homeDirectory}/.config/zed" = {
      enable = true;
      source = ./zed;
      recursive = true;
    };
  };
}
