{ self, ... }:
{
  flake.nixosModules.hostsDesktopModulesHardware = {
    options.services.rgb.enable = true;
  };
}
