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

      # vibe-rs needs aws-lc in buildInputs so aws-lc-sys (built with
      # AWS_LC_SYS_USE_SYSTEM=1) can link the system AWS-LC
      mistralVibe = pkgs.mistral-vibe.overrideAttrs (old: {
        passthru = (old.passthru or { }) // {
          vibe-rs = old.passthru.vibe-rs.overrideAttrs (oldRs: {
            buildInputs = (oldRs.buildInputs or [ ]) ++ [ pkgs.aws-lc ];
          });
        };
      });
    in
    {
      options.programs.ai = {
        enable = mkEnableOption "Enables AI modules";
      };

      config = mkIf config.programs.ai.enable {
        environment.systemPackages = with pkgs; [
          claude-code
          mistralVibe
          llama-cpp-vulkan
        ];
      };
    };
}
