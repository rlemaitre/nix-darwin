{

  home.file.".gnupg/gpg.conf".text = ''
    auto-key-retrieve
    #no-emit-version
    personal-cipher-preferences AES256 AES192 AES
    personal-digest-preferences SHA512 SHA384 SHA256
    personal-compress-preferences ZLIB BZIP2 ZIP Uncompressed
    default-preference-list SHA512 SHA384 SHA256 AES256 AES192 AES ZLIB BZIP2 ZIP Uncompressed
    cert-digest-algo SHA512
    s2k-digest-algo SHA512
    s2k-cipher-algo AES256
    charset utf-8
    no-comments
    no-emit-version
    no-greeting
    keyid-format 0xlong
    list-options show-uid-validity
    verify-options show-uid-validity
    with-fingerprint
    require-cross-certification
    no-symkey-cache
    armor
    use-agent
    throw-keyids
  '';

  #  https://github.com/NixOS/nixpkgs/issues/240819#issuecomment-1616760598
  home.file.".gnupg/gpg-agent.conf".text = ''
    default-cache-ttl 600
    max-cache-ttl 7200
    enable-ssh-support
    pinentry-program /opt/homebrew/bin/pinentry-mac
  '';
  home.file.".gnupg/pinentry-ide.sh" = {
    executable = true;
    text = ''
      !/bin/sh
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
  home.file.".gnupg/scdaemon.conf".text = ''
    reader-port Yubikey
    disable-ccid
  '';
}
