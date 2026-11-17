{self, ...}: {
  flake.nixosModules.hostsLaptopModulesPrograms = {
    programs.browsing = {
      zen.enable = true;
    };
    programs.development.enable = true;
    programs.media.enable = true;
    programs.productivity.enable = true;
    programs.terminal.enable = true;
    programs.emulators.enable = true;
  };
}
