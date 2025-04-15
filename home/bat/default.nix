{ pkgs, ... }: {
  programs.bat = {
    enable = true;
    config = {
      theme = "OneHalfLight";
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
