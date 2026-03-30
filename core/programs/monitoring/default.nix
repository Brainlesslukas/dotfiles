{ self, ... }:
{
  flake.nixosModules.coreProgramsMonitoring = {
    imports = [
      self.nixosModules.coreProgramsMonitoringFastfetch
      self.nixosModules.coreProgramsMonitoringBtop
      self.nixosModules.coreProgramsMonitoringResources
    ];
  };
}
