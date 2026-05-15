{ self, ... }:
{
  flake.nixosModules.coreServices = {
    imports = [
      self.nixosModules.coreServicesUpower
      self.nixosModules.coreServicesPowerProfiles
      self.nixosModules.coreServicesStreamdeck
    ];
  };
}
