{ self, ... }:
{
  flake.nixosModules.hostsLaptopModules = {
    imports = [
      self.nixosModules.hostsLaptopModulesUserOptions
      self.nixosModules.hostsLaptopModulesMonitors
      self.nixosModules.hostsLaptopModulesPrograms
    ];
    services.logind.settings.Login.HandleLidSwitch = "ignore";
  };
}
