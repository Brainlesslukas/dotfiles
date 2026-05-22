{ self, ... }:
{
  flake.nixosModules.hostsLaptopModulesPrograms = {
    programs.browsing.firefox.enable = true;
    programs.browsing.zen.enable = true;
    programs.browsing.chromium.enable = true;
  };
}
