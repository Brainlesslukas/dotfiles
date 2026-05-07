{ self, ... }:
{
  flake.nixosModules.coreServices = {
    imports = [
      self.nixosModules.coreServicesUpower
      self.nixosModules.coreServicesPowerProfiles
    ];
  };
}
