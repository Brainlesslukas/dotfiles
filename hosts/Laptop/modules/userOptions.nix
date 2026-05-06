{ self, ... }:
{
  flake.nixosModules.hostsLaptopModulesUserOptions =
    { config, ... }:
    {
      config.userOptions = {
        hostName = "Laptop";
        userName = "lukas";
      };
    };
}
