{ self, ... }:
{
  flake.nixosModules.hostsLaptopModulesUserOptions =
    { config, ... }:
    {
      config.userOptions = {
        hostName = "Laptop";
        userName = "lukas";
        wallpaper = "sunset-forest-light.jpg";
      };
    };
}
