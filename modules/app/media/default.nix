{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppMedia =
    {
      config,
      pkgs,
      lib,
      ...
    }:
    let
      inherit (lib) mkEnableOption mkIf;
    in

    {
      imports = [ inputs.spicetify-nix.nixosModules.default ];

      options.programs.media = {
        enable = mkEnableOption "Enables media modules";
      };

      config = mkIf config.programs.media.enable {
        programs.spicetify = {
          enable = true;
        };
      };
    };
}
