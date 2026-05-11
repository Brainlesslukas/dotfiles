{ self, inputs, ... }:
{
  flake.nixosModules.modulesDesktopNoctalia =
    { pkgs, config, ... }:
    let
      inherit (config.userOptions) userName;
    in
    {
      home-manager.users.${userName} = {
        imports = [
          inputs.noctalia.homeModules.default
        ];

        home.file.".cache/noctalia/wallpapers.json" = {
          text = builtins.toJSON {
            defaultWallpaper = "/home/lukas/dotfiles/assets/wallpapers/everblush.jpg";
          };
        };

        programs.noctalia-shell = {
          enable = true;

          settings = {
            settingsVersion = 59;
            bar = {
              density = "comfortable";
              barType = "floating";
              showCapsule = false;
              contentPadding = 8;
              marginVertical = 12;
              marginHorizontal = 20;
              middleClickCommand = "settings";
              widgets = {
                left = [
                  {
                    id = "ControlCenter";
                    useDistroLogo = true;
                  }
                  {
                    id = "SystemMonitor";
                  }
                ];
                center = [
                  {
                    id = "Workspace";
                    labelMode = "none";
                  }
                ];
                right = [
                  {
                    id = "MediaMini";
                  }
                  {
                    id = "Volume";
                  }
                  {
                    id = "Bluetooth";
                  }
                  {
                    id = "Network";
                  }
                  {
                    id = "Tray";
                  }
                  {
                    id = "Battery";
                  }
                  {
                    id = "Clock";
                    formatHorizontal = "HH:mm";
                    formatVertical = "HH mm";
                    useMonospacedFont = true;
                  }
                  {
                    id = "NotificationHistory";
                  }
                ];
              };
            };
            general = {
              scaleRatio = 0.9;
            };
            dock = {
              enabled = false;
            };
            location = {
              monthBeforeDay = false;
              name = "Stuttgart, Germany";
            };
          };
        };
      };
    };
}
