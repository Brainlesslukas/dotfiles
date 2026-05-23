{ self, inputs, ... }:
{
  flake.nixosModules.coreServicesStreamdeck =
    { config, pkgs, lib, ... }:
    let
      inherit (lib) mkEnableOption mkIf; 
    in 
    {
      options.services.streamdeck = {
        enable = mkEnableOption "Enables streamdeck service";
      };

      config = mkIf config.services.streamdeck.enable {
        services.udev.extraRules = ''
          KERNEL=="ttyUSB[0-9]*", MODE="0666"
        '';

        systemd.user.services.streamdeck = {
          description = "Run the daemon for my selfbuild streamdeck";
          wantedBy = [ "graphical-session.target" ];
          path = with pkgs; [
            direnv
            bash
            nix
          ];

          serviceConfig = {
            Type = "simple";
            WorkingDirectory = "/home/lukas/development/streamdeck/Listener";
            ExecStart = "${pkgs.direnv}/bin/direnv exec . python3 -u listener.py";
            Restart = "on-failure";
            RestartSec = 3;
          };
          };
      };
    };
}
