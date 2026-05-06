{ self, ... }:
{
  flake.nixosModules.hostsLaptopModules = {
    imports = [
      self.nixosModules.hostsLaptopModulesUserOptions
    ];
    services.logind.settings.Login.HandleLidSwitch = "ignore";
  };
}
