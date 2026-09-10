{ self, ... }:
{
  flake.nixosModules.hostsDesktopModulesHardware = {
    config.services.rgb.enable = true;
  };
}
