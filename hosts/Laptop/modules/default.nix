{ self, ... }:
{
  flake.nixosModules.hostsLaptopModules = {
    imports = [
      self.nixosModules.hostsLaptopModulesUserOptions
    ];
  };
}
