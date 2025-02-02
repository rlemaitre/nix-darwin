{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "scala"
      "nord"
    ];
  };
  imports = [
    ./keymap.nix
    ./settings.nix
  ];
}
