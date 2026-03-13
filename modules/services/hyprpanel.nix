{ pkgs, ... }:

{
  home-manager.users.lukas = {
    programs.hyprpanel = {
      enable = true;
      settings = {
        bar.layouts = {
          "*" = {
            left = [
              "dashboard"
              "workspaces"
            ];
            middle = [ "media" ];
            right = [
              "clock"
              "notifications"
            ];
          };
        };
        bar.clock.format = "%H:%M";
        bar.clock.icon = "";
        bar.launcher.autoDetectIcon = true;
        bar.workspaces.workspaces = 2;
        menus.clock.time.military = true;
        theme.bar.border.location = "bottom";
      };
    };
  };
}

