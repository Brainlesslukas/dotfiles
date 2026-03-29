{ self, ... }:
{
  flake.nixosModules.modules = {
    imports = [
      self.nixosModules.modulesApp
      self.nixosModules.modulesDesktop
      self.nixosModules.modulesShell
    ];
  };
}
