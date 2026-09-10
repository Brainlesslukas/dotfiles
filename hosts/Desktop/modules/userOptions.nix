{ self, ... }:
{
  flake.nixosModules.hostsDesktopModulesUserOptions =
    { config, ... }:
    {
      config.userOptions = {
        hostName = "Desktop";
        userName = "lukas";
        location = "Stuttgart, DE";
        browser = "zen";
      };
    };
}
