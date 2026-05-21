{ self, inputs, ... }:
{

  flake.nixosModules.modulesDesktopHyprHyprpaper =
    { pkgs, config, ... }:
    let
      inherit (config.userOptions) userName wallpaper;
    in
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager.users.${userName} = {
        services.hyprpaper = {
          enable = true;
          settings = {
            preload = [ "~/dotfiles/assets/wallpapers/${wallpaper}" ];
            splash = false;
            wallpaper = [
              {
                monitor = "";
                path = "~/dotfiles/assets/wallpapers/${wallpaper}";
                fit_mode = "cover";
              }
            ];
          };
        };
      };
    };
}
