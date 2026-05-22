{ self, inputs, ... }:
{
  flake.nixosConfigurations.Desktop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.DesktopHardwareConfig
      self.nixosModules.core
      self.nixosModules.modules
      self.nixosModules.hostsCommon
      self.nixosModules.usersLukas
      self.nixosModules.hostsDesktopModules
    ];
  };
}
