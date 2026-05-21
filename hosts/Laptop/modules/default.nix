{ self, ... }:
{
  flake.nixosModules.hostsLaptopModules = {
    imports = [
      self.nixosModules.hostsLaptopModulesUserOptions
      self.nixosModules.hostsLaptopModulesMonitors
    ];
    services.logind.settings.Login.HandleLidSwitch = "ignore";
  };
}
