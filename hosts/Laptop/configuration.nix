{ self, inputs, ... }:
{

  flake.nixosModules.LaptopConfig =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    {
      environment.variables = {
        XDG_CURRENT_DESKTOP = "Hyprland";
        XDG_SESSION_DESKTOP = "Hyprland";
        GTK_USE_PORTAL = "1";
        GDK_BACKEND = "wayland,x11";
        QT_QPA_PLATFORM = "wayland";
      };

      programs.hyprland.enable = true;
      virtualisation.docker.enable = true;

      services.logind.settings.Login.HandleLidSwitch = "ignore";
    };
}
