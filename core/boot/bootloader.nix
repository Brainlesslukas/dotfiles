{self, ...}: {
  flake.nixosModules.coreBootBootloader = {
    boot = {
      loader = {
        grub = {
          enable = true;
          device = "nodev";
          efiSupport = true;
        };
        limine.enable = true;
        efi.canTouchEfiVariables = true;
      };
    };
  };
}
