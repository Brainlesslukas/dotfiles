{ self, inputs, ... }:
{
  flake.nixosConfigurations.Laptop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.LaptopConfig
      self.nixosModules.LaptopHardwareConfig
      self.nixosModules.core
      self.nixosModules.modules
    ];
  };
}
