{
  programs.mise = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    globalConfig = {
      tools = {
        golang = "1.19.1";
        helm = "3.12.2";
        java = "oracle-graalvm-21.0.2";
        just = "1.16.0";
        mill = "0.12.4";
        nodejs = "21.6.1";
        coursier = "latest";
        python = "latest";
        sbt = "1.10.0";
        scala = "3.6.3";
        scala-cli = "1.3.2";
        yarn = "4.5.3";
        "npm:better-commits" = "latest";
        delta = "0.18.2";
        kubectl = "1.29.2";
      };
    };
    settings = {
      experimental = true;
    };
  };
}
