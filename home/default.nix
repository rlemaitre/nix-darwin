{
  pkgs,
  userConfig,
  ...
}: {
  # moar https://github.com/yuanw/nix-home/blob/main/modules/macintosh.nix

  # import sub modules
  imports = [
    ./direnv/default.nix
    ./bat/default.nix
    ./eza/default.nix
    ./fd/default.nix
    ./files/default.nix
    ./fzf/default.nix
    ./gh/default.nix
    ./git/default.nix
    ./gpg/default.nix
    ./lazygit/default.nix
    ./nixneovim/default.nix
    ./zed-editor/default.nix
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
