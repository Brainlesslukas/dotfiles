{ self, inputs, ... }:
{

  flake.nixosModules.modulesDesktopHypr =
    { pkgs, ... }:
    {
      imports = [
        self.nixosModules.modulesDesktopHyprHyprland
        self.nixosModules.modulesDesktopHyprHyprpanel
        self.nixosModules.modulesDesktopHyprHyprpaper
        self.nixosModules.modulesDesktopHyprMonitors
      ];

      environment.systemPackages = with pkgs; [
        yazi
      ];
    };
}
