{
  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        nerdFontsVersion = "3";
      };
      git = {
        pager = "delta --paging=never";
      };
      os = {
        editPreset = "nvim";
      };
    };
  };
}
