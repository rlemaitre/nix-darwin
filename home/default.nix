{ config, inputs, pkgs, lib, userConfig, ... }:


{

  # moar https://github.com/yuanw/nix-home/blob/main/modules/macintosh.nix

  # import sub modules
  imports = [
    ./bat/default.nix
    ./docker/default.nix
    ./gpg/default.nix
    ./nixneovim/default.nix
  ];

  # home manager needs this
  home = {
    username = "${userConfig.username}";
    homeDirectory = "${userConfig.homeDirectory}";
    stateVersion = "23.11";
  };

  # https://github.com/NixOS/nixpkgs/blob/master/pkgs/os-specific/darwin/
  home.packages = with pkgs; [
    chafa
    coreutils
    eza # modern replacement for `ls`
    delta
    fd # modern replacement for `find`
    fzf
    fzf-git-sh
    gh
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

  # TODO hardware.keyboard.zsa.enable

  home.file = {
    "${userConfig.homeDirectory}/.config/ghostty" = {
      enable = true;
      source = ./files/ghostty;
      recursive = true;
    };
    # "${userConfig.homeDirectory}/.config/nvim" = {
    #   enable = true;
    #   source = ./files/nvim;
    #   recursive = true;
    # };
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
