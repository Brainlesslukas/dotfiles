{ self, ... }:
{

  flake.nixosModules.modulesAppBrowsingTor =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    let
      inherit (lib) mkEnableOption mkIf;
    in
    {
      options.programs.browsing.tor = {
        enable = mkEnableOption "Tor Browser";
      };

      config = mkIf config.programs.browsing.tor.enable {
        environment.systemPackages = with pkgs; [
          tor-browser
        ];

        services.tor = {
          enable = true;
          client = {
            enable = true;
          };
        };
      };
    };
}
