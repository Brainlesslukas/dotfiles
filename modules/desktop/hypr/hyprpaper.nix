{ self, inputs, ... }:
{

  flake.nixosModules.modulesDesktopHyprHyprpaper =
    { pkgs, config, ... }:
    let
      inherit (config.userOptions) userName;
    in
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager.users.${userName} = {
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
