{ self, inputs, ... }:
{
  flake.nixosModules.modulesDesktopNoctalia =
    { pkgs, ... }:
    {
      home-manager.users.lukas = {
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
            bar = {
              density = "comfortable";
              barType = "floating";
              showCapsule = false;
              contentPadding = 8;
              marginVertical = 12;
              marginHorizontal = 20;
              middleCliclCommand = "settings";
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
                    usePrimaryColor = true;
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
