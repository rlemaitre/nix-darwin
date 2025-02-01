{
  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
      hosts = [
        "https://github.com"
        "https://gist.github.com"
      ];
      settings = {
        aliases = {
          co = "pr checkout";
          pv = "pr view";
        };
        protocol = "ssh";
      };
    };
  };
  programs.gh-dash = {
    enable = true;
    settings = {
      prSections = [
        {
          title = "In Review";
          query = "is:pr is:open review-requested:@me";
        } {
          title = "Assigned";
          query = "is:pr is:open assignee:@me";
        } {
          title = "Created by Me";
          query = "is:pr is:open author:@me";
        }
      ];
    };
  };
}
