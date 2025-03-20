{pkgs, ...}: {
  environment.extraInit = ''
    export PATH=$HOME/bin:$PATH
  '';

  nixpkgs.config.allowUnfree = true;

  # install packages from nix's official package repository.
  environment.systemPackages = with pkgs; [
    alejandra
    git
    # github-copilot-intellij-agent # Copilot plugin for IntelliJ
    inkscape # Vector graphics editor
    mos
    nil # nix language server
    nixd
    nixfmt # https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-fmt#examples
    slack
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

    taps = [];

    # brew install
    brews = [
      "mise"
      "pinentry-mac"
      "usage"
    ];

    # brew install --cask
    # these need to be updated manually
    casks = [
      "1password" # password manager
      "beeper" # Multiprotocol instant messaging app
      "betterdisplay" # Display management app
      "capacities" # Note taking app
      "chatgpt" # AI chatbot
      "datagrip" # Database management
      "elgato-camera-hub" # Camera hub
      "elgato-capture-device-utility" # Video capture
      "elgato-stream-deck" # Stream deck
      "elgato-wave-link" # Wave link
      "fantastical" # Calendar app
      "font-fira-code" # Fira code font
      "font-fira-code-nerd-font" # Fira code nerd font
      "font-hack-nerd-font" # Hack nerd font
      "ghostty" # Terminal emulator
      "intellij-idea"  # IDE
      "mutedeck" # Mute deck
      "obs" # Open Broadcaster Software
      "obs-advanced-scene-switcher" # Advanced scene switcher
      "obs-backgroundremoval" # Background removal
      "orbstack" # Docker Desktop replacement
      "orion" # Web Browser
      "philips-hue-sync" # Hue sync
      "proton-drive" # Proton drive
      "proton-mail" # Proton maildd
      "proton-pass" # Proton pass
      "protonvpn" # Proton VPN
      "raindropio" # Bookmark manager
      "raspberry-pi-imager" # Raspberry Pi imager
      "raycast" # Raycast
      "shottr" # Screenshot app
      # "slack" # Slack
      "the-unarchiver" # Unarchiver
      "vivaldi" # Web browser
      "yubico-authenticator" # Yubico authenticator
      "yubico-yubikey-manager" # Yubikey manager
    ];

    # mac app store
    # click
    masApps = {
      amphetamine = 937984704;
      neewer-control-center = 1664344174;
    };
  };
}
