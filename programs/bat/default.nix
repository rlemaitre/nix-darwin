{ pkgs, ... }: {
  programs.bat = {
    enable = true;
    config = {
      theme = "Nord";
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
