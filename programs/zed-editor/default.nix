{
  programs.zed-editor = {
    enable = false;
    extensions = [
      "Catppuccin"
      "scala"
      "nord"
    ];
  };
  imports = [
    ./keymap.nix
    ./settings.nix
  ];
}
