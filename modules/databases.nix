{pkgs, ...}: {
  services.postgresql = {
    enable = false;
    enableTCPIP = true;
    package = pkgs.postgresql_17;
    checkConfig = true;
    ensureDatabases = [];
    ensureUsers = [];
  };
}
