{ self, ... }:
{
  flake.nixosModules.hostsDesktopModules = {
    imports = [
      self.nixosModules.hostsDesktopModulesUserOptions
      self.nixosModules.hostsDesktopModulesMonitors
      self.nixosModules.hostsDesktopModulesPrograms
      self.nixosModules.hostsDesktopModulesServices
    ];
    services.logind.settings.Login.HandleLidSwitch = "ignore";
  };
}
