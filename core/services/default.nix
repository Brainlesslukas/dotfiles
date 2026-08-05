{ self, ... }:
{
  flake.nixosModules.coreServices = {
    imports = [
      self.nixosModules.coreServicesUpower
      self.nixosModules.coreServicesPowerProfiles
      self.nixosModules.coreServicesStreamdeck
      self.nixosModules.coreServicesGnome
      self.nixosModules.coreServicesCtrlpadDaemon
      self.nixosModules.coreServicesSnap
    ];
  };
}
