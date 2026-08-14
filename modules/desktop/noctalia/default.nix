{ self, inputs, ... }:
{
  flake.nixosModules.modulesDesktopNoctalia =
    { pkgs, config, ... }:
    let
      inherit (config.userOptions) userName location;
    in
    {
      home-manager.users.${userName} = {
        imports = [
          inputs.noctalia.homeModules.default
        ];

        programs.noctalia = {
          enable = true;

          settings = {
            wallpaper = {
              directory = "/home/${userName}/dotfiles/assets/wallpapers/";
            };
            theme = {
              mode = "dark";
              source = "custom";
              custom_palette = "stylix";
            };
            widget = {
              network.show_label = false;
              workspaces.show_labels = false;
              tray.drawer = true;
              volume.show_label = false;
              battery = {
                hide_when_plugged = true;
                hide_when_full = true;
              };
            };
            calendar = {
              enabled = true;
              refresh_minutes = 5;
            };
            shell = {
              avatar_path = "/home/${userName}/dotfiles/assets/avatar.png";
            };
            location = {
              address = location;
              auto_locate = false;
            };
            bar.default = {
              concave_edge_corners = false;
              shadow = false;
              radius = 6;
              margin_ends = 24;
              margin_edge = 20;
              padding = 16;
              widget_spacing = 12;
              thickness = 38;
              start = [
                "session"
                "sysmon"
                "battery"
              ];
              center = [ "workspaces" ];
              end = [
                "bluetooth"
                "network"
                "volume"
                "clock"
                "tray"
                "notifications"
              ];
            };
          };
        };
      };
    };
}
