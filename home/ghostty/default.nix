{ pkgs, ...}: {
  # it doesn't work as ghostty is marked as `broken` on darwin
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    package = pkgs.unstable.ghostty;
    settings = {
      theme = "light:Kanagawa Lotus,dark:Kanagawa Wave";
      copy-on-select = "clipboard";
      macos-titlebar-style = "tabs";
      window-theme = "system";
      window-inherit-working-directory = false;

    };
  };
}
