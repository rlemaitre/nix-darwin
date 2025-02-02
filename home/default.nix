{ pkgs, userConfig, ... }: {

  # moar https://github.com/yuanw/nix-home/blob/main/modules/macintosh.nix

  # import sub modules
  imports = [
    ./bat/default.nix
    ./docker/default.nix
    ./eza/default.nix
    ./fd/default.nix
    ./files/default.nix
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
}
