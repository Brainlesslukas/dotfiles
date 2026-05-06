{ self, ... }:
{
  flake.nixosModules.core = {
    imports = [
      self.nixosModules.coreProgramsUtils
      self.nixosModules.coreProgramsMonitoring
      self.nixosModules.coreBoot
      self.nixosModules.coreUser
      self.nixosModules.coreHardware
      self.nixosModules.coreNix
    ];
  };
}
