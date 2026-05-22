{ self, ... }:
{
  flake.nixosModules.hostsLaptopModulesPrograms = {
    programs.browsing = {
      firefox.enable = true;
      zen.enable = true;
      chromium.enable = true;
    };
  };
}
