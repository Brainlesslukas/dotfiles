{ self, ... }:
{
  flake.nixosModules.coreProgramsUtils = {
    imports = [
      self.nixosModules.coreProgramsUtilsNeovim
      self.nixosModules.coreProgramsUtilsTtyclock
      self.nixosModules.coreProgramsUtilsPipes
      self.nixosModules.coreProgramsUtilsCava
      self.nixosModules.coreProgramsUtilsRipgrep
      self.nixosModules.coreProgramsUtilsRclone
    ];
  };
}
