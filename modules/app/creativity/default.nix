{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppCreativity =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    let
      inherit (lib) mkEnableOption mkIf;
    in
    {
      options.programs.creativity = {
        enable = mkEnableOption "Enables creativity modules";
      };

      config = mkIf config.programs.productivity.enable {
        environment.systemPackages = with pkgs; [
          blender
          kicad
        ];
      };
    };
}
