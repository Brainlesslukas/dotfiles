{ self, ... }:
{
  flake.nixosModules.coreHardwareGraphics = {
   hardware.graphics = {
      enable = true;
      enable32Bit = true;
    }; 
  };
}
