{ self, ... }:
{
  flake.nixosModules.hostsDesktopModules = {
    imports = [
      self.nixosModules.hostsDesktopModulesUserOptions
      self.nixosModules.hostsDesktopModulesMonitors
      self.nixosModules.hostsDesktopModulesPrograms
    ];
    services.logind.settings.Login.HandleLidSwitch = "ignore";
  };
}
