{ pkgs, ... }:

{
  home-manager.users.lukas = {
    services.hyprpaper = {
      enable = true;
      settings = {
        preload = [ "~/Wallpaper/gruvbox-nix.png" ];
        splash = false;
        wallpaper = [
          {
            monitor = "";
            path = "~/Wallpaper/gruvbox-nix.png";
            fit_mode = "cover";
          }
        ];
      };
    };
  };
}
