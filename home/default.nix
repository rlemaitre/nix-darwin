{ config, inputs, pkgs, lib, ... }:

{

  # moar https://github.com/yuanw/nix-home/blob/main/modules/macintosh.nix

  # import sub modules
  imports = [
#    ./link-home-manager-installed-apps.nix
    ./docker.nix
#    ./gw.nix
    ./gpg.nix
    ./bat.nix
  ];

  # home manager needs this
  home = {
    username = "raphael.lemaitre";
    homeDirectory = "/Users/raphael.lemaitre";
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
    neovim
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
    "~/.config/ghostty" = {
      enable = true;
      source = ./files/ghostty;
      recursive = true;
    };
    "~/.config/nvim" = {
      enable = true;
      source = ./files/nvim;
      recursive = true;
    };
    "~/.config/oh-my-posh" = {
      enable = true;
      source = ./files/oh-my-posh;
      recursive = true;
    };
    "~/.config/pistol" = {
      enable = true;
      source = ./files/pistol;
      recursive = true;
    };
    "~/.config/zed" = {
      enable = true;
      source = ./files/zed;
      recursive = true;
    };
    "~/.config/zsh" = {
      enable = true;
      source = ./files/zsh;
      recursive = true;
    };
  };
}
