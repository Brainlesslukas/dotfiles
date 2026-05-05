{ self, ... }:
{
  flake.nixosModules.coreBootBootloader = {
    boot = {
      loader = {
        grub = {
          enable = true;
          device = "nodev";
          efiSupport = true;
        };
        efi.canTouchEfiVariables = true;
      };
    };
  };
}
