{ inputs, pkgs, ... }: {

  environment.extraInit = ''
    export PATH=$HOME/bin:$PATH
  '';

  # install packages from nix's official package repository.
  environment.systemPackages = with pkgs; [
    git
    nil # nix language server
    nixfmt # https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-fmt#examples
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
    };

    taps = [ ];

    # brew install
    brews = [
      "pinentry-mac"
    ];

    # brew install --cask
    # these need to be updated manually
    casks = [
      "1password"                   # password manager
      "beeper"                      # Multiprotocol instant messaging app
      "betterdisplay"               # Display management app
      "capacities"                  # Note taking app
      "chatgpt"                     # AI chatbot
      "datagrip"                    # Database IDE
      "elgato-camera-hub"           # Camera hub
      "elgato-stream-deck"          # Stream deck
      "elgato-wave-link"            # Wave link
      "fantastical"                 # Calendar app
      "font-fira-code"              # Fira code font
      "font-fira-code-nerd-font"    # Fira code nerd font
      "font-hack-nerd-font"         # Hack nerd font
      "ghostty"                     # Terminal emulator
      "gpg-suite-no-mail"           # GPG suite
      "inkscape"                    # Vector graphics editor
      "intellij-idea"                # IDE
      "mutedeck"                    # Mute deck
      "obs"                         # Open Broadcaster Software
      "obs-advanced-scene-switcher" # Advanced scene switcher
      "obs-backgroundremoval"       # Background removal
      "openaudible"                 # Audible audiobook converter
      "orbstack"                    # Docker Desktop replacement
      "orion"                       # Web Browser
      "philips-hue-sync"            # Hue sync
      "proton-drive"                # Proton drive
      "proton-mail"                 # Proton mail
      "proton-pass"                 # Proton pass
      "protonvpn"                   # Proton VPN
      "raindropio"                  # Bookmark manager
      "raycast"                     # Raycast
      "shottr"                      # Screenshot app
      "slack"                       # Slack
      "the-unarchiver"              # Unarchiver
      "zed"                         # Text editor
    ];

    # mac app store
    # click
    masApps = {
      amphetamine = 937984704;
    };
  };
}
