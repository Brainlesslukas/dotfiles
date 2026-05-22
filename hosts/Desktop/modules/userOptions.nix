{ self, ... }:
{
  flake.nixosModules.hostsDesktopModulesUserOptions =
    { config, ... }:
    {
      config.userOptions = {
        hostName = "Desktop";
        userName = "lukas";
        wallpaper = "sunset-forest-light.jpg";
      };
    };
}
