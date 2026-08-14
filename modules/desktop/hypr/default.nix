{ self, inputs, ... }:
{

  flake.nixosModules.modulesDesktopHypr =
    { pkgs, ... }:
    {
      imports = [
        self.nixosModules.modulesDesktopHyprHyprland
        self.nixosModules.modulesDesktopHyprMonitors
      ];
    };
}
