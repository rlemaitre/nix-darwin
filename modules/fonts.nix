{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      aileron
      alegreya
      corefonts
      fira
      fira-code
      font-awesome
      helvetica-neue-lt-std
      inconsolata
      inter-nerdfont
      lato
      line-awesome
      meslo-lg
      meslo-lgs-nf
      minecraftia
      mona-sans
      monaspace
      monocraft
      monoid
      mononoki
      montserrat
      nacelle
      open-fonts
      open-sans
      pixel-code
      poppins
      quicksand
      roboto
      roboto-flex
      roboto-mono
      roboto-serif
      roboto-slab
      source-sans
      source-sans-pro
      ubuntu-classic
      ubuntu-sans
      ubuntu-sans-mono
      xkcd-font
    ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
  };
}
