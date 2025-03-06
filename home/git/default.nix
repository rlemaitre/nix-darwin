{
  programs.git = {
    enable = true;
    aliases = {
      bb = "!better-branch";
      bc = "!better-commits";
    };
    attributes = [
      "*.pdf diff=pdf"
    ];
    delta = {
      enable = true;
      options = {
        navigate = true;
        side-by-side = true;
        line-numbers = true;
      };
    };
    includes = [
      {
        contents = {
          user = {
            name = "Raphaël Lemaitre";
            email = "raphael@rlemaitre.com";
            signingKey = "FA8F2AA7A6D1C219";
          };
          github = {
            user = "rlemaitre";
          };
          core = {
            sshCommand = "ssh -i /Users/raphael.lemaitre/.ssh/rlemaitre.pem";
          };
        };
      }
      {
        condition = "gitdir:/Users/raphael.lemaitre/Developer/github.com/LedgerHQ/*";
        contents = {
          user = {
            name = "Raphaël Lemaitre";
            email = "raphael.lemaitre@ledger.fr";
            signingKey = "90C3CD1F68B07B31";
          };
          github = {
            user = "rlemaitre-ledger";
          };
          core = {
            sshCommand = "ssh -i /Users/raphael.lemaitre/.ssh/rlemaitre-ledger.pem";
          };
        };
      }
    ];
    maintenance = {
      enable = true;
      repositories = [];
    };
    # signing = {
      # signByDefault = true;
      # gpgPath = "/etc/profiles/per-user/raphael.lemaitre/bin/gpg";
    # };
    extraConfig = {
      format = {
        pretty = "oneline";
      };
      init = {
        defaultBranch = "main";
      };
      push = {
        default = "upstream";
        autoSetupRemote = true;
        followTags = true;
      };
      credential = {
        helper = "cache";
      };
      pull = {
        rebase = true;
      };
      branch = {
        sort = "-committerdate";
      };
      tag = {
        sort = "version:refname";
      };
      column = {
        ui = "auto";
      };
      diff = {
        algorithm = "histogram";
        colorMoved = "plain";
        mnemonicPrefix = true;
        renames = true;
      };
      fetch = {
        prune = true;
        pruneTags = true;
        all = true;
      };
      help = {
        autocorrect = "prompt";
      };
      commit = {
        verbose = true;
      };
      rerere = {
        enabled = true;
        autoupdate = true;
      };
      rebase = {
        autoSquash = true;
        autoStash = true;
        updateRefs = true;
      };
      core = {
        fsmonitor = true;
        untrackedCache = true;
      };
      merge = {
        conflictstyle = "zdiff3";
      };
    };
    ignores = [
      ### Intellij+all ###
      # Covers JetBrains IDEs: IntelliJ, RubyMine, PhpStorm, AppCode, PyCharm, CLion, Android Studio, WebStorm and Rider
      # Reference: https://intellij-support.jetbrains.com/hc/en-us/articles/206544839
      # User-specific stuff
      ".idea/**/workspace.xml"
      ".idea/**/tasks.xml"
      ".idea/**/usage.statistics.xml"
      ".idea/**/dictionaries"
      ".idea/**/shelf"
      # AWS User-specific
      ".idea/**/aws.xml"
      # Generated files
      ".idea/**/contentModel.xml"
      # Sensitive or high-churn files
      ".idea/**/dataSources/"
      ".idea/**/dataSources.ids"
      ".idea/**/dataSources.local.xml"
      ".idea/**/sqlDataSources.xml"
      ".idea/**/dynamic.xml"
      ".idea/**/uiDesigner.xml"
      ".idea/**/dbnavigator.xml"
      # Gradle
      ".idea/**/gradle.xml"
      ".idea/**/libraries"
      # Gradle and Maven with auto-import
      # When using Gradle or Maven with auto-import, you should exclude module files,
      # since they will be recreated, and may cause churn.  Uncomment if using
      # auto-import.
      # ".idea/artifacts"
      # ".idea/compiler.xml"
      # ".idea/jarRepositories.xml"
      # ".idea/modules.xml"
      # ".idea/*.iml"
      # ".idea/modules"
      # "*.iml"
      # "*.ipr"
      # CMake
      "cmake-build-*/"
      # Mongo Explorer plugin
      ".idea/**/mongoSettings.xml"
      # File-based project format
      "*.iws"
      # IntelliJ
      "out/"
      # mpeltonen/sbt-idea plugin
      ".idea_modules/"
      # JIRA plugin
      "atlassian-ide-plugin.xml"
      # Cursive Clojure plugin
      ".idea/replstate.xml"
      # SonarLint plugin
      ".idea/sonarlint/"
      # Crashlytics plugin (for Android Studio and IntelliJ)
      "com_crashlytics_export_strings.xml"
      "crashlytics.properties"
      "crashlytics-build.properties"
      "fabric.properties"
      # Editor-based Rest Client
      ".idea/httpRequests"
      # Android studio 3.1+ serialized cache file
      ".idea/caches/build_file_checksums.ser"
      ### Intellij+all Patch ###
      # Ignore everything but code style settings and run configurations
      # that are supposed to be shared within teams.
      ".idea/*"
      "!.idea/codeStyles"
      "!.idea/runConfigurations"

      ### macOS ###
      # General
      ".DS_Store"
      ".AppleDouble"
      ".LSOverride"
      # Icon must end with two \r
      "Icon\r\r"
      # Thumbnails
      "._*"
      # Files that might appear in the root of a volume
      ".DocumentRevisions-V100"
      ".fseventsd"
      ".Spotlight-V100"
      ".TemporaryItems"
      ".Trashes"
      ".VolumeIcon.icns"
      ".com.apple.timemachine.donotpresent"
      # Directories potentially created on remote AFP share
      ".AppleDB"
      ".AppleDesktop"
      "Network Trash Folder"
      "Temporary Items"
      ".apdisk"
      ### macOS Patch ###
      # iCloud generated files
      "*.icloud"
      ### Metals ###
      ".metals/"
      ".bloop/"
      "project/**/metals.sbt"
      ### Vim ###
      # Swap
      "[._]*.s[a-v][a-z]"
      "!*.svg"  # comment out if you don't need vector files
      "[._]*.sw[a-p]"
      "[._]s[a-rt-v][a-z]"
      "[._]ss[a-gi-z]"
      "[._]sw[a-p]"
      # Session
      "Session.vim"
      "Sessionx.vim"
      # Temporary
      ".netrwhist"
      "*~"
      # Auto-generated tag files
      "tags"
      # Persistent undo
      "[._]*.un~"
      ### VisualStudioCode ###
      ".vscode/*"
      "!.vscode/settings.json"
      "!.vscode/tasks.json"
      "!.vscode/launch.json"
      "!.vscode/extensions.json"
      "!.vscode/*.code-snippets"
      # Local History for Visual Studio Code
      ".history/"
      # Built Visual Studio Code Extensions
      "*.vsix"
      ### VisualStudioCode Patch ###
      # Ignore all local history of files
      ".history"
      ".ionide"
    ];
  };
}
