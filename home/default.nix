{ pkgs, userConfig, ... }: {

  # moar https://github.com/yuanw/nix-home/blob/main/modules/macintosh.nix

  # import sub modules
  imports = [
    ./bat/default.nix
    ./docker/default.nix
    ./eza/default.nix
    ./fd/default.nix
    ./fzf/default.nix
    ./gh/default.nix
    ./gpg/default.nix
    ./nixneovim/default.nix
  ];

  # home manager needs this
  home = {
    username = "${userConfig.username}";
    homeDirectory = "${userConfig.homeDirectory}";
    stateVersion = "24.11";
  };

  # https://github.com/NixOS/nixpkgs/blob/master/pkgs/os-specific/darwin/
  home.packages = with pkgs; [
    chafa
    coreutils
    delta
    fzf-git-sh
    git
    gnupg
    hexyl
    lazygit
    oh-my-posh
    pinentry_mac
    pistol
    ripgrep
    tldr
    tree-sitter
    viu
    zoxide
  ];
  home.file = {
    "${userConfig.homeDirectory}/.config/ghostty" = {
      enable = true;
      source = ./files/ghostty;
      recursive = true;
    };
    "${userConfig.homeDirectory}/.config/oh-my-posh" = {
      enable = true;
      source = ./files/oh-my-posh;
      recursive = true;
    };
    "${userConfig.homeDirectory}/.config/pistol" = {
      enable = true;
      source = ./files/pistol;
      recursive = true;
    };
    "${userConfig.homeDirectory}/.config/zed" = {
      enable = true;
      source = ./files/zed;
      recursive = true;
    };
    "${userConfig.homeDirectory}/.config/zsh" = {
      enable = true;
      source = ./files/zsh;
      recursive = true;
    };
  };
}
