{
  self,
  pkgs,
  ...
}: {
  flake.nixosModules.coreBootBootloader = {pkgs, ...}: {
    boot = {
      loader = {
        limine.enable = true;
        limine.secureBoot.enable = true;
        efi.canTouchEfiVariables = true;
      };
    };

    environment.systemPackages = [
      pkgs.sbctl
    ];
  };
}
