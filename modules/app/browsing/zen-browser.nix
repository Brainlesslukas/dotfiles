{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppBrowsingZenbrowser =
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
      options.programs.browsing.zen = {
        enable = mkEnableOption "Zen Browser";
      };

      config = mkIf config.programs.browsing.zen.enable {
        environment.systemPackages = with pkgs; [
          inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];
      };
    };
}
