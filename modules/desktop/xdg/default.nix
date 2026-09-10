{ self, ... }:
{
  flake.nixosModules.modulesDesktopXdg =
    { config, pkgs, ... }:
    let
      inherit (config.userOptions) userName browser;
    in
    {
      home-manager.users.${userName} = {
        xdg.mimeApps = {
          enable = true;
          defaultApplications = {
            "text/html" = "${browser}.desktop";
            "x-scheme-handler/http" = "${browser}.desktop";
            "x-scheme-handler/https" = "${browser}.desktop";
            "x-scheme-handler/about" = "${browser}.desktop";
            "x-scheme-handler/unknown" = "${browser}.desktop";
            "inode/directory" = [ "yazi.desktop" ];
            "video/avi" = [ "vlc.desktop" ];
            "video/mp4" = [ "vlc.desktop" ];
            "video/x-matroska" = [ "vlc.desktop" ];
          };
        };
        xdg.portal = {
          enable = true;
          xdgOpenUsePortal = true;
          config.common = {
            default = [
              "hyprland"
              "gtk"
            ];
            "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
            "org.freedesktop.impl.portal.FileChooser" = [ "yazi.desktop" ];
          };
          extraPortals = with pkgs; [
            xdg-desktop-portal
            xdg-desktop-portal-gtk
            xdg-desktop-portal-hyprland
          ];
        };
      };
    };
}
