{ self, ... }:
{

  flake.nixosModules.modulesAppBrowsingChromium =
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
      options.programs.browsing.chromium = {
        enable = mkEnableOption "Chromium Browser";
      };

      config = mkIf config.programs.browsing.chromium.enable {
        environment.systemPackages = with pkgs; [
          chromium
        ];
      };
    };
}
