{
  hostname,
  userConfig,
  ...
}: {
  networking.hostName = hostname;
  networking.computerName = hostname;
  system.defaults.smb.NetBIOSName = hostname;

  users.users."${userConfig.username}" = {
    home = userConfig.homeDirectory;
    description = userConfig.fullname;
  };
}
