{ self, ... }:
{
  flake.nixosModules.coreProgramsMonitoring = {
    imports = [
      self.nixosModules.coreProgramsMonitoringFastfetch
    ];
  };
}
