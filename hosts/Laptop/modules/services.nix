{self, ...}: {
  flake.nixosModules.hostsLaptopModulesServices = {
    services.powerprofiles.enable = true;
    services.Upower.enable = true;
  };
}
