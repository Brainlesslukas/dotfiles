{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppBrowsingHelium =
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
      options.programs.browsing.helium = {
        enable = mkEnableOption "Helium Browser";
      };

      imports = [ inputs.helium-flake.nixosModules.default ];

      config = mkIf config.programs.browsing.helium.enable {
        programs.helium.enable = true;
      };
    };
}
