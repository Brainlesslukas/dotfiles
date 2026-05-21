{ self, inputs, ... }:
{

  flake.nixosModules.modulesDesktopHyprHyprpanel =
    { pkgs, config, ... }:
    let
      inherit (config.userOptions) userName;
    in

    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager.users.${userName} = {
        programs.hyprpanel = {
          enable = false;
          settings = {
            bar.layouts = {
              "*" = {
                left = [
                  "dashboard"
                  "workspaces"
                ];
                middle = [ "media" ];
                right = [
                  "cava"
                  "clock"
                  "notifications"
                ];
              };
            };
            bar = {
              clock.format = "%H:%M";
              clock.icon = "";
              launcher.autoDetectIcon = true;
              workspaces.workspaces = 2;
            };
            menus.clock.time.military = true;
            theme.bar.border.location = "bottom";
          };
        };
      };
    };
}
