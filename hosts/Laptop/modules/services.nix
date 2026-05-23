{ self, ... }:
{
  flake.nixosModules.hostsLaptopModulesServices = {
    services.powerprofiles.enable = true; 
    services.streamdeck.enable = true;
    services.upower.enable = true;
  };
}
