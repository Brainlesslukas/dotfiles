{ self, ... }:
{
  flake.nixosModules.coreServicesUpower = {
    services.upower.enable = true;
  };
}
