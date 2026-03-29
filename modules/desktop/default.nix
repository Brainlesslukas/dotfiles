{ self, ... }:
{
  flake.nixosModules.modulesDesktop = {
    imports = [
      self.nixosModules.modulesDesktopHypr
      self.nixosModules.modulesDesktopStylix
    ];
  };
}
