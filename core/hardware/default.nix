{ self, ... }:
{
  flake.nixosModules.coreHardware = {
    imports = [
      self.nixosModules.coreHardwareNetwork
    ];
  };
}
