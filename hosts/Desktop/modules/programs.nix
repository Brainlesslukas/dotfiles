{ self, ... }:
{
  flake.nixosModules.hostsDesktopModulesPrograms = {
    programs = {
      gaming.enable = true;
      browsing.zen.enable = true;
    };
  };
}
