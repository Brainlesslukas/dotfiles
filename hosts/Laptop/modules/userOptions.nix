{ self, ... }:
{
  flake.nixosModules.hostsLaptopModulesUserOptions =
    { config, ... }:
    {
      config.userOptions = {
        hostName = "Laptop";
        userName = "lukas";
        location = "Stuttgart, DE";
      };
    };
}
