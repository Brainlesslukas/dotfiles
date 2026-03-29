{ self, ... }:
{
  flake.nixosModules.core = {
    imports = [
      self.nixosModules.coreFastfetch
      self.nixosModules.coreHome
      self.nixosModules.coreNh
    ];
  };
}
