{ self, inputs, ... }:
{

  flake.nixosModules.modulesDesktopLy =
    { pkgs, config, ... }:
    let
      inherit (config.userOptions) userName;
    in
    {
      services.displayManager.ly = {
        enable = true;
        settings = {
          defaultUser = userName;
          bigclock = "en";
          save = true;
        };
      };
    };
}
