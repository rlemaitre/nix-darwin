{ pkgs, userConfig, ... }: {

  programs.gpg = {
    enable = true;
    package = pkgs.gnupg24;
    scdaemonSettings = {
      "reader-port" = "Yubico Yubi";
    };
  };

  home.packages = with pkgs; [ pinentry_mac ];

  # gnu --batch --import
  #  https://github.com/NixOS/nixpkgs/issues/240819#issuecomment-1616760598
  home.file.".local/share/gnupg/gpg-agent.conf".text = ''
    # seconds after the last GnuPG activity
    default-cache-ttl 28800
    default-cache-ttl-ssh 28800

    # seconds it caches after entering your password
    max-cache-ttl 28800
    max-cache-ttl-ssh 28800

    # allow presetting the passphrase from 1password
    allow-preset-passphrase

    # mac
    pinentry-program "${userConfig.homeDirectory}/.local/share/gnupg/pinentry-ide.sh"

    enable-ssh-support

    # remember to reload it after editing this file
    #  killall gpg-agent && gpg-connect-agent reloadagent /bye

    # prevent scdaemon error messages in syslog regarding a smart card reader
    # you don't have one
    # disable-scdaemon
  '';
  home.file.".local/share/gnupg/pinentry-ide.sh" = {
    executable = true;
    text = ''
      #!/bin/sh
      if [ -n "$PINENTRY_USER_DATA" ]; then
        case "$PINENTRY_USER_DATA" in
          IJ_PINENTRY=*)
            "/Applications/IntelliJ IDEA.app/Contents/jbr/Contents/Home/bin/java" -cp "/Applications/IntelliJ IDEA.app/Contents/plugins/vcs-git/lib/git4idea-rt.jar:/Applications/IntelliJ IDEA.app/Contents/lib/externalProcess-rt.jar" git4idea.gpg.PinentryApp
            exit $?
          ;;
        esac
      fi
      exec /opt/homebrew/bin/pinentry-mac "$@"
    '';
  };
}
