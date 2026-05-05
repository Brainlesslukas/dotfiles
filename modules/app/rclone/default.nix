{ self, inputs, ... }:
{
  flake.nixosModules.modulesAppRclone =
    { pkgs, ... }:
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      environment.systemPackages = with pkgs; [ rclone ];

      home-manager.users.lukas = {
        systemd.user.services.mount-cloud =
          let
            mountDir = "/home/lukas/Cloud";
          in
          {
            Unit = {
              Description = "Mount Cloud to the filesystem";
              After = [ "network-online.target" ];
            };
            Service = {
              Type = "notify";
              ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p ${mountDir}";
              ExecStart = ''
                ${pkgs.rclone}/bin/rclone mount cloud: ${mountDir} \
                  --config="%h/.config/rclone/rclone.conf" \
                  --vfs-cache-mode full \
                  --vfs-cache-max-age 1m \
                  --dir-cache-time 30s \
                  --poll-interval 15s
              '';
              ExecStop = "/run/wrappers/bin/fusermount -u ${mountDir}";
              Restart = "always";
              RestartSec = 5;
            };
            Install.WantedBy = [ "default.target" ];
          };
      };
    };
}
