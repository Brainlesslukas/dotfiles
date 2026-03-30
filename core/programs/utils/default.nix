{ self, ... }:
{
  flake.nixosModules.coreProgramsUtils = {
    imports = [
      self.nixosModules.coreProgramsUtilsNeovim
    ];
  };
}
