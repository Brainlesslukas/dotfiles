{ self, ... }:
{
  flake.nixosModules.hostsCommonUserOptions =
    { config, ... }:
    {
      config.userOptions = {
        hostName = "Laptop";
        userName = "lukas";
      };
    };
}
