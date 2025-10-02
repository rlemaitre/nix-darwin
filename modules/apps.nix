{pkgs, ...}: {
  environment.extraInit = ''
    export PATH=$HOME/bin:$PATH
  '';

  nixpkgs.config = {
    allowBroken = false;
    allowUnfree = true;
  };

  # install packages from nix's official package repository.
  environment.systemPackages = with pkgs; [
    alejandra
    git
    # github-copilot-intellij-agent # Copilot plugin for IntelliJ
    inkscape # Vector graphics editor
    git-machete
    mos
    nil # nix language server
    nixd
    nixfmt-classic # https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-fmt#examples
    slack
    pkgs.unstable.coursier
    pkgs.unstable.usage
    pkgs.unstable.hugo
    pkgs.unstable.presenterm
    pkgs.unstable.zstd
  ];

  # To make this work, homebrew need to be installed manually, see
  # https://brew.sh The apps installed by homebrew are not managed by nix, and
  # not reproducible!  But on macOS, homebrew has a much larger selection of
  # apps than nixpkgs, especially for GUI apps!

  # work mac comes with brew
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      cleanup = "zap";
      upgrade = true;
    };

    taps = [
      "loopwork/tap"
    ];

    # brew install
    brews = [
      # "bun"
      "gnupg"
      "mise"
      "pinentry-mac"
      "usage"
      "ykman"
      "yubikey-personalization"
    ];

    # brew install --cask
    # these need to be updated manually
    casks = [
      "adguard"
      "beeper" # Multiprotocol instant messaging app
      "betterdisplay" # Display management app
      "claude" # AI chatbot
      "discord" # Discord client
      "elgato-camera-hub" # Camera hub
      "elgato-capture-device-utility" # Video capture
      "elgato-stream-deck" # Stream deck
      "font-fira-code" # Fira code font
      "font-fira-code-nerd-font" # Fira code nerd font
      "font-hack-nerd-font" # Hack nerd font
      "freedom" # Freedom app
      "ghostty" # Terminal emulator
      "gpg-suite-no-mail" # GPG suite
      "imcp"
      "intellij-idea-ce" # IDE
      "jetbrains-toolbox" # Jetbrains toolbox
      "lm-studio" # LM studio
      "languagetool-desktop"
      "msty"
      "mutedeck" # Mute deck
      "netnewswire"
      "obs" # Open Broadcaster Software
      "obs-advanced-scene-switcher" # Advanced scene switcher
      "obs-backgroundremoval" # Background removal
      "obsidian" # Note taking app
      "ollama-app"
      "orbstack" # Docker Desktop replacement
      "orion" # Web Browser
      "pronotes"
      "proton-drive" # Proton drive
      "proton-mail" # Proton maildd
      "proton-pass" # Proton pass
      "protonvpn" # Proton VPN
      "qlmarkdown"
      "raycast" # Raycast
      "sensiblesidebuttons"
      "signal" # Signal client
      "steam" # Steam
      "the-unarchiver" # Unarchiver
      "vivaldi" # Web browser
      "yubico-authenticator" # Yubico authenticator
      "zed" # Zed editor
      "zoom"
      "zotero"
    ];

    # mac app store
    # click
    masApps = {
      actions = 1586435171;
      adguard-for-safari = 1440147259;
      amphetamine = 937984704;
      data-jar = 1453273600;
      developer = 640199958;
      ground-news = 1324203419;
      joko-for-safari = 1559239914;
      kagi-for-safari = 1622835804;
      keynote = 409183694;
      kindle = 302584613;
      mes-envies-for-safari = 1437106857;
      neewer-control-center = 1664344174;
      numbers = 409203825;
      obsidian-web-clipper = 6720708363;
      pages = 409201541;
      swift-playground = 1496833156;
      xcode = 497799835;
    };
  };
}
