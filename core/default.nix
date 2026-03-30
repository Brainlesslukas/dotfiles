{ self, ... }:
{
  flake.nixosModules.core = {
    imports = [
      self.nixosModules.coreHome
      self.nixosModules.coreNh
      self.nixosModules.coreProgramsUtils
      self.nixosModules.coreProgramsMonitoring
    ];
  };
}
