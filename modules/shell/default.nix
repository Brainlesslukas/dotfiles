{ self, ... }:
{
  flake.nixosModules.modulesShell = {
    imports = [
      self.nixosModules.modulesShellZsh
      self.nixosModules.modulesShellBat
    ];
  };
}
