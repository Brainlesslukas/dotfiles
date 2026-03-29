{ self, inputs, ... }:
{

  flake.nixosModules.coreFastfetch =
    { pkgs, ... }:

    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager.users.lukas = {
        programs.fastfetch = {
          enable = true;
          settings = {
            logo = {
              type = "kitty-direct";
              source = "~/Wallpaper/nix-snowflake.png";
              width = 18;
              height = 8;
              padding.top = 1;
            };
            display.separator = "  ";
            modules = [
              "break"
              "title"
              {
                type = "os";
                format = "I use {pretty-name} btw.";
                keyColor = "red";
              }
              {
                type = "wm";
                format = "{pretty-name} {version}";
                keyColor = "green";
              }
              {
                type = "kernel";
                format = "{sysname} {release}";
                keyColor = "yellow";
              }
              {
                type = "disk";
                key = "Disk";
                format = "{size-used} / 500GiB";
                keyColor = "blue";
              }
              {
                type = "memory";
                key = "RAM";
                format = "{used} / 16GiB";
                keyColor = "magenta";
              }
              {
                type = "packages";
                format = "{all}";
                keyColor = "cyan";
              }
              {
                type = "uptime";
                format = "{formatted}";
                keyColor = "red";
              }
            ];
          };
        };
      };
    };
}
