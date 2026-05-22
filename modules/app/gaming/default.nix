{ self, ... }:
{
  flake.nixosModules.modulesAppGaming =
    { config, lib, pkgs, ... }:

    let
      inherit (lib) mkEnableOption mkIf;
    in
    {
      options.programs.gaming = {
        enable = mkEnableOption "Gaming profile";
      };

      config = mkIf config.programs.gaming.enable {
        environment.systemPackages = with pkgs; [
          lunar-client
          modrinth-app
          steam
        ];
      };
    };
}
