{
  self,
  pkgs,
  ...
}: {
  flake.nixosModules.coreBootBootloader = {
    pkgs,
    lib,
    ...
  }: {
    boot = {
      tmp.cleanOnBoot = true;
      loader = {
        limine = {
          enable = true;
          secureBoot.enable = true;
          resolution = "3440x1440";
          biosDevice = "nodev";
          maxGenerations = 5;
          style = {
            interface.resolution = "3440x1440";
            wallpaperStyle = "centered";
          };
        };
        efi.canTouchEfiVariables = true;
        timeout = 1;
      };
    };

    stylix.targets.limine.imageScalingMode.enable = false;

    environment.systemPackages = [
      pkgs.sbctl
    ];
  };
}
