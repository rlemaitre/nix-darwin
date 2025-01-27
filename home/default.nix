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
    ./pistol.nix
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
    gh-f
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
  };
}
