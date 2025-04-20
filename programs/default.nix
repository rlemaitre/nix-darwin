{
  pkgs,
  userConfig,
  ...
}: {
  # moar https://github.com/yuanw/nix-home/blob/main/modules/macintosh.nix

  # import sub modules
  imports = [
    ./direnv/default.nix
    # shells
    ./bash/default.nix
    ./fish/default.nix
    ./zsh/default.nix
    # databases
    # ./postgresql/default.nix
    # utilities
    ./bat/default.nix
    ./eza/default.nix
    ./fd/default.nix
    ./files/default.nix
    ./fzf/default.nix
    ./gh/default.nix
    # ./ghostty/default.nix # uncomment when ghostty work on darwin
    ./git/default.nix
    ./gpg/default.nix
    ./lazygit/default.nix
    # ./nixneovim/default.nix
    ./zed-editor/default.nix
  ];

  # home manager needs this
  home = {
    username = "${userConfig.username}";
    homeDirectory = "${userConfig.homeDirectory}";
    stateVersion = "24.11";
    preferXdgDirectories = true;
  };

  # https://github.com/NixOS/nixpkgs/blob/master/pkgs/os-specific/darwin/
  home.packages = with pkgs; [
    chafa
    coreutils
    delta
    fzf-git-sh
    git
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

  xdg = {
    enable = true;
    cacheHome = "${userConfig.homeDirectory}/.cache";
    configHome = "${userConfig.homeDirectory}/.config";
    dataHome = "${userConfig.homeDirectory}/.local/share";
    stateHome = "${userConfig.homeDirectory}/.local/state";
  };
}
