{ config, lib, pkgs, ... }: {
  programs.bat = {
    enable = true;
    package = pkgs.bat;
    config = {
      theme = "Nord";
      italic-text = "always";
    }
    extraPackages = with pkgs.bat-extras; [
      batdiff
      batman
      batgrep
      batwatch
    ]
  }
}
