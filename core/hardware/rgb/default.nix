{ self, inputs, ... }:
{
  flake.nixosModules.coreServicesRgb =
    {
      lib,
      config,
      pkgs,
      ...
    }:
    let
      inherit (lib) mkEnableOption mkIf;
    in
    {
      options.services.rgb = {
        enable = mkEnableOption "Enables rgb services";
      };

      config = mkIf config.services.rgb.enable {
        services.hardware.openrgb.enable = true;
      };
    };
}
