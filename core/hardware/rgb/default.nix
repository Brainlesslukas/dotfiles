{ self, inputs, ... }:
{
  flake.nixosModules.coreHardwareRgb =
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
      options.services.rgb = {
        enable = mkEnableOption "Enables rgb services";
      };

      config = mkIf config.services.rgb.enable {
        services.hardware.openrgb.enable = true;

        services.udev.extraRules = ''
          KERNEL=="i2c-0", MODE="0660", GROUP="OpenLinkHub"
        '';

        users.groups.OpenLinkHub = { };

        users.users.OpenLinkHub = {
          isSystemUser = true;
          group = config.users.groups.OpenLinkHub.name;
          extraGroups = [ config.users.groups.input.name ];
        };

        systemd.services.OpenLinkHub =
          let
            path = "/var/lib/OpenLinkHub";
            package = pkgs.openlinkhub;
          in
          {
            enable = true;
            description = "Open source interface for iCUE LINK System Hub, Corsair AIOs and Hubs";

            preStart = ''
              mkdir -p ${path}/database
              [ -f ${path}/database/rgb.json ] || cp ${package}/opt/OpenLinkHub/database/rgb.json ${path}/database/rgb.json
              mkdir -p /run/udev/rules.d

              for dir in ${package}/opt/OpenLinkHub/database/*/; do
                name=$(basename "$dir")
                mkdir -p ${path}/database/"$name"
                cp -r -n "$dir". ${path}/database/"$name"/
              done

              [ -L ${path}/static ] || ln -s ${package}/opt/OpenLinkHub/static ${path}/static
              [ -L ${path}/web ] || ln -s ${package}/opt/OpenLinkHub/web ${path}/web

              ${pkgs.usbutils}/bin/lsusb -d 1b1ce | while read -r line; do
              ids=$(echo "$line" | ${pkgs.gawk}/bin/awk '{print $6}')
              vendor_id=$(${pkgs.coreutils}/bin/echo "$ids" | ${pkgs.coreutils}/bin/cut -d':' -f1)
              device_id=$(${pkgs.coreutils}/bin/echo "$ids" | ${pkgs.coreutils}/bin/cut -d':' -f2)
              ${pkgs.coreutils}/bin/cat > /run/udev/rules.d/99-corsair-openlinkhub-"$device_id".rules <<- EOM
              KERNEL=="hidraw*", SUBSYSTEMS=="usb", ATTRS{idVendor}=="$vendor_id", ATTRS{idProduct}=="$device_id", MODE="0666"
              EOM
              done

              ${pkgs.coreutils}/bin/chmod -R 744 ${path}
              ${pkgs.coreutils}/bin/chown -R OpenLinkHub:OpenLinkHub ${path}

              ${pkgs.systemd}/bin/udevadm control --reload
              ${pkgs.systemd}/bin/udevadm trigger
            '';

            postStop = ''
              ${pkgs.coreutils}/bin/rm /var/lib/OpenLinkHub/web
              ${pkgs.coreutils}/bin/rm /var/lib/OpenLinkHub/static

              ${pkgs.coreutils}/bin/rm /run/udev/rules.d/99-corsair-openlinkhub-*.rules
              ${pkgs.systemd}/bin/udevadm control --reload
              ${pkgs.systemd}/bin/udevadm trigger
            '';

            path = [ pkgs.pciutils ];

            serviceConfig = {
              User = config.users.users.OpenLinkHub.name;
              Group = config.users.groups.OpenLinkHub.name;
              ExecStart = "${package}/bin/OpenLinkHub";
              ExecReload = "${pkgs.coreutils}/bin/kill -s HUP \$MAINPID";
              RestartSec = 5;
              PermissionsStartOnly = true;
              StateDirectory = "OpenLinkHub";
              WorkingDirectory = "/var/lib/OpenLinkHub";
            };

            wantedBy = [ "multi-user.target" ];
          };
      };
    };
}
