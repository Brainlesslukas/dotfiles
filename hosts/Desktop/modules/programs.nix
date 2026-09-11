{ self, ... }:
{
  flake.nixosModules.hostsDesktopModulesPrograms = {
    programs.browsing = {
      zen.enable = true;
      chromium.enable = true;
    };
    programs.development.enable = true;
    programs.communication.enable = true;
    programs.media.enable = true;
    programs.gaming.enable = true;
    programs.terminal.enable = true;
    programs.emulators.enable = true;
    programs.productivity.enable = true;
    programs.ai.enable = true;
  };
}
