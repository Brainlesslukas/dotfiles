{ self, ... }:
{
  flake.nixosModules.modulesAppAi =
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
      options.programs.ai = {
        enable = mkEnableOption "AI profile";
      };

      config = mkIf config.programs.ai.enable {
        environment.systemPackages = with pkgs; [
          ollama
          claude-code
        ];
      };
    };
}
