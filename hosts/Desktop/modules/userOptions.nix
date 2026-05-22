{ self, ... }:
{
  flake.nixosModules.hostsDesktopModulesUserOptions =
    { config, ... }:
    {
      config.userOptions = {
        hostName = "Dekstop";
        userName = "lukas";
        wallpaper = "sunset-forest-light.jpg";
      };
    };
}
