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
        location = lib.mkOption {
          type = lib.types.str;
          description = ''
            The location you live in, used by Noctalia. E.g. "Stuttgart, DE"
          '';
        };
      };
    };
}
