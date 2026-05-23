{ self, ... }:
{
  flake.nixosModules.coreServicesUpower =
    { lib, config, ... }:
    let
      inherit (lib) mkEnableOption mkIf;
    in
    {
      options.services.Upower = {
        enable = mkEnableOption "Enables upower service";
      };

      config = mkIf config.services.Upower.enable {
        services.upower.enable = true;
      };
    };
}
