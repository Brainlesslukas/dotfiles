{ self, ... }:
{
  flake.nixosModules.hostsLaptopModulesServices = {
    services.powerprofiles.enable = true;
    services.CtrlpadDaemon.enable = true;
    services.Upower.enable = true;
  };
}
