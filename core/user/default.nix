{ self, ... }:
{
  flake.nixosModules.coreUser =
    { lib, ... }:
    {
      options.userOptions = {
        hostName = lib.mkOption {
          type = lib.types.str;
          description = ''
            The hostname you want to use e.g. "Desktop", "Laptop", ...
          '';
        };
        userName = lib.mkOption {
          type = lib.types.str;
          description = ''
            The username you want to use e.g. "basti", "user", ...
          '';
        };
        wallpaper = lib.mkOption {
          type = lib.types.str;
          description = ''
            The filename of the wallpaper you want to use e.g. "my-wallpaper.png". Located in /dotfiles/assets/wallpapers
          '';
        };
      };
    };
}
