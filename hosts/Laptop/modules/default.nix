{ self, ... }:
{
  flake.nixosModules.hostsLaptopModules = {
    imports = [
      self.nixosModules.hostsLaptopModulesUserOptions
      self.nixosModules.hostsLaptopModulesMonitors
      self.nixosModules.hostsLaptopModulesPrograms
      self.nixosModules.hostsLaptopModulesServices
    ];
    services.logind.settings.Login.HandleLidSwitch = "ignore";
  };
}
