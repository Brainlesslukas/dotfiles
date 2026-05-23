{ self, ... }:
{
  flake.nixosModules.hostsLaptopModulesPrograms = {
    programs.browsing = {
      firefox.enable = true;
      zen.enable = true;
      chromium.enable = true;
    };
    programs.communication.enable = true;
    programs.development.enable = true;
    programs.media.enable = true;
    programs.productivity.enable = true;
    programs.terminal.enable = true;
    programs.emulators.enable = true;
  };
}
