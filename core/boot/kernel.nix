{ self, ... }:
{
  flake.nixosModules.coreBootKernel =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    {
      boot = {
        kernelParams = [
          "quiet"
          "splash"
          "loglevel=3"
          "video=HDMI-A-1:3440x1440@100"
          "video=eDP-1:1920x1080"
          "intremap=on"
          "boot.shell_on_fail"
          "udev.log_priority=3"
          "rd.systemd.show_status=auto"
          "rd.udev.log_priority=3"
          "vt.global_cursor_default=0"
        ];
        initrd = {
          verbose = false;
          systemd.enable = true;
          kernelModules = [
            "i915"
          ];
        };
        consoleLogLevel = 3;
        kernelPackages = pkgs.linuxPackages_zen;
      };
    };
}
