{ pkgs, ... }: {
  programs.bat = {
    enable = true;
    config = {
      theme-dark = "Nord";
      theme-light = "Nord";
      italic-text = "always";
    };
    extraPackages = with pkgs.bat-extras; [
      batdiff
      batman
      batgrep
      batwatch
    ];
  };
}
