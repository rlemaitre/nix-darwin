{ ... }:

let
  hostname = "LMFR0150";
  username = "raphael.lemaitre";
in {
  networking.hostName = hostname;
  networking.computerName = hostname;
  system.defaults.smb.NetBIOSName = hostname;

  users.users."${username}" = {
    home = "/Users/${username}";
    description = username;
  };
}
