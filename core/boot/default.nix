{ self, ... }:
{
  flake.nixosModules.coreBoot = {
    imports = [
      self.nixosModules.coreBootBootloader
      self.nixosModules.coreBootPlymouth
      self.nixosModules.coreBootKernel
    ];
  };
}
