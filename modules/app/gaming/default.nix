{ self, ... }:
{
  flake.nixosModules.modulesAppGaming =
    {
      config,
      lib,
      pkgs,
      ...
    }:

    let
      inherit (lib) mkEnableOption mkIf;
    in
    {
      options.programs.gaming = {
        enable = mkEnableOption "Enables gaming module";
      };

      config = mkIf config.programs.gaming.enable {
        nixpkgs.config.allowUnfree = true;
        environment.systemPackages = with pkgs; [
          lunar-client
          modrinth-app
          steam
        ];
      };
    };
}
