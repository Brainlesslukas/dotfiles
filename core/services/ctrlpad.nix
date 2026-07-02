{ self, ... }:
{
  flake.nixosModules.coreServicesCtrlpad =
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
      options.services.Ctrlpad = {
        enable = mkEnableOption "Enables ctrlapad daemon service";
      };

      config = mkIf config.services.Ctrlpad.enable {
        systemd.user.services.ctrlpad-daemon = {
          enable = true;
          description = "CtrlPad Daemon";
          after = [ "network.target" ];
          serviceConfig = {
            Type = "simple";
            ExecStart = "${pkgs.bash}/bin/bash -l -c '/usr/local/bin/ctrlpad-daemon'";
            Restart = "on-failure";
          };
        };
      };
    };
}
