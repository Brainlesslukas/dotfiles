{ self, ... }:
{
  flake.nixosModules.hostsDesktopModulesPrograms = {
    programs.gaming.enable = true;
  };
}
