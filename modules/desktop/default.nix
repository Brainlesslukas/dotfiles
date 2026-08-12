{ self, ... }:
{
  flake.nixosModules.modulesDesktop =
    { pkgs, ... }:
    {
      imports = [
        self.nixosModules.modulesDesktopHypr
        self.nixosModules.modulesDesktopStylix
        self.nixosModules.modulesDesktopNoctalia
        self.nixosModules.modulesDesktopVicinae
        self.nixosModules.modulesDesktopXdg
        self.nixosModules.modulesDesktopLy
        self.nixosModules.modulesDesktopFlameshot
      ];
      environment.systemPackages = with pkgs; [
        yazi
      ];
    };
}
