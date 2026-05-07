{ self, inputs, ... }:
{

  flake.nixosModules.modulesDesktopHyprHyprpaper =
    { pkgs, ... }:

    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager.users.lukas = {
        services.hyprpaper = {
          enable = true;
          settings = {
            preload = [ "~/dotfiles/assets/wallpapers/everblush.jpg" ];
            splash = false;
            wallpaper = [
              {
                monitor = "";
                path = "~/dotfiles/assets/wallpapers/everblush.jpg";
                fit_mode = "cover";
              }
            ];
          };
        };
      };
    };
}
