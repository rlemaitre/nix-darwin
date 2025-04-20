{userConfig, ...}: {
  environment = {
    shellAliases = {
      # Show all files in the current directory
      ls = "eza --git --git-repos --color=always --color-scale=all --color-scale-mode=gradient --all --icons always --smart-group --group-directories-first --hyperlink --modified --classify=always";
      ll = "ls --long";
      l = "ll --no-user --no-permissions --octal-permissions --time-style=relative";

      cat = "bat";
      grep = "rg";
      diff = "delta";
      top = "gotop";
      brwe = "brew";
      pinentry = "pinentry-mac";
      nix-shell = "nix-shell --run $SHELL";
    };
    variables = {
      XDG_DATA_HOME = "${userConfig.homeDirectory}/.local/share";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_STATE_HOME = "$HOME/.local/state";
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_RUNTIME_DIR = "$HOME/Library/Caches/TemporaryItems";
      ZDOTDIR = "$HOME/.config/zsh";
      ZHOMEDIR = "$HOME/.config/zsh";
      ZRCDIR = "$ZHOMEDIR/rc";
      ZDATADIR = "$XDG_DATA_HOME/zsh";
      ZCACHEDIR = "$XDG_CACHE_HOME/zsh";
    };

  };
}
