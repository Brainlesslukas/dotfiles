{ self, inputs, ... }:
{
  flake.nixosModules.coreServicesCtrlpadDaemon =
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
      imports = [ inputs.ctrlpad-daemon.nixosModules.default ];
      options.services.CtrlpadDaemon = {
        enable = mkEnableOption "Enables ctrlapad daemon service";
      };

      config = mkIf config.services.CtrlpadDaemon.enable {
        services.ctrlpad-daemon.enable = true;
      };
    };
}
