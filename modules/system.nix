 {
  # https://daiderd.com/nix-darwin/manual/index.html#sec-options

  time.timeZone = "Europe/Paris";

  system = {
    activationScripts.activateSettings.text = ''
      # Following line should allow us to avoid a logout/login cycle
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';

    keyboard.enableKeyMapping = true;
    keyboard.remapCapsLockToControl = true;

    defaults = {
      # clock
      menuExtraClock.Show24Hour = true;
      menuExtraClock.ShowSeconds = true;

      # https://github.com/LnL7/nix-darwin/blob/master/modules/system/defaults/trackpad.nix
      trackpad = {
        # tap to click
        Clicking = true;
        # tap-tap-drag to drag
        Dragging = true;
        # two-finger-tap right click
        TrackpadRightClick = true;
      };

      # https://github.com/LnL7/nix-darwin/blob/master/modules/system/defaults/NSGlobalDomain.nix
      NSGlobalDomain = {
        # Show hidden files
        AppleShowAllFiles = true;

        # keyboard navigation in dialogs
        AppleKeyboardUIMode = 3;

        # disable press-and-hold for keys in favor of key repeat
        ApplePressAndHoldEnabled = false;

        # Show all file extensions
        AppleShowAllExtensions = true;

        # Disable auto-capitalization
        NSAutomaticCapitalizationEnabled = false;

        # Enable inline prediction
        NSAutomaticInlinePredictionEnabled = true;

        # Disable smart dashes
        NSAutomaticDashSubstitutionEnabled = false;

        # Disable smart periods
        NSAutomaticPeriodSubstitutionEnabled = false;

        # Disable smart quotes
        NSAutomaticQuoteSubstitutionEnabled = false;

        # Disable auto-correct
        NSAutomaticSpellingCorrectionEnabled = false;

        # fast key repeat rate when hold
        KeyRepeat = 2;
        InitialKeyRepeat = 15;

        # Use expanded print dialog by default
        PMPrintingExpandedStateForPrint = true;
        PMPrintingExpandedStateForPrint2 = true;

        # Use function keys as standard function keys
        # "com.apple.keyboard.fnState" = true;

        # Enable "Natural" scrolling
        "com.apple.swipescrolldirection" = true;

        # Use metric units
        AppleMetricUnits = 1;
        AppleTemperatureUnit = "Celsius";
        AppleICUForce24HourTime = true;
      };

      # killall Dock to make them have effect
      # https://github.com/LnL7/nix-darwin/blob/master/modules/system/defaults/dock.nix
      dock = {
        autohide = true;
        magnification = true;
        # most recently used spaces
        mru-spaces = false;
        orientation = "right";
        tilesize = 32;
        largesize = 96;
      };

      # https://github.com/LnL7/nix-darwin/blob/master/modules/system/defaults/finder.nix
      finder = {
        # show hidden files
        AppleShowAllFiles = true;
        # bottom status bar
        ShowStatusBar = true;
        ShowPathbar = true;

        # Search the current folder by default
        FXDefaultSearchScope = "SCcf";

        # default to column view
        FXPreferredViewStyle = "clmv";
        # show file extensions
        AppleShowAllExtensions = true;
        # Never show icons on desktop
        CreateDesktop = false;
        # full path in window title
        _FXShowPosixPathInTitle = true;
        # Keep folders on top when sorting by name
        _FXSortFoldersFirst = true;
      };

      # https://github.com/LnL7/nix-darwin/blob/master/modules/system/defaults/SoftwareUpdate.nix
      SoftwareUpdate = {
        # Automatically install Mac OS software updates
        AutomaticallyInstallMacOSUpdates = true;
      };

      # https://github.com/LnL7/nix-darwin/blob/master/modules/system/defaults/WindowManager.nix
      WindowManager = {
        # Disable Stage Manager
        GloballyEnabled = false;

        # Do not reveal desktop when clicking on it
        EnableStandardClickToShowDesktop = false;

        # Hide items on desktop
        StandardHideDesktopIcons = true;

        # Hide widgets on desktop
        StandardHideWidgets = true;
        StageManagerHideWidgets = true;
      };

      CustomUserPreferences = {
        "NSGlobalDomain" = {
          # Disable "natural" scrolling for mouse
          "com.apple.scrollwheel.scaling" = -1;
        };
      };
    };

    # error from nix-darwin without this one
    stateVersion = 5;
  };

  # touchid for sudo authentication
  security.pam.services.sudo_local.touchIdAuth = true;

  # load env vars set via home manager
  environment.extraInit = let
    homeManagerSessionVars = "/etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh";
  in ''
    [[ -f ${homeManagerSessionVars} ]] && source ${homeManagerSessionVars}
  '';
}
