{ self, ... }:
{
  flake.nixosModules.hostsDesktopModulesPrograms = {
    programs.browsing.zen.enable = true;
    programs.gaming.enable = true;
    programs.communication.enable = true;
    programs.media.enable = true;
    programs.terminal.enable = true;
  };
}
