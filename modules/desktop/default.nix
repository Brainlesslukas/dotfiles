{ self, ... }:
{
  flake.nixosModules.modulesDesktop = {
    imports = [
      self.nixosModules.modulesDesktopHypr
      self.nixosModules.modulesDesktopStylix
      self.nixosModules.modulesDesktopNoctalia
      self.nixosModules.modulesDesktopVicinae
      self.nixosModules.modulesDesktopXdg
    ];
  };
}
