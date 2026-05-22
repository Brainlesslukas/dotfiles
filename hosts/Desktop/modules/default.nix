{ self, ... }:
{
  flake.nixosModules.hostsDesktopModules = {
    imports = [
      self.nixosModules.hostsDesktopModulesUserOptions
      self.nixosModules.hostsDesktopModulesMonitors
    ];
    services.logind.settings.Login.HandleLidSwitch = "ignore";
  };
}
