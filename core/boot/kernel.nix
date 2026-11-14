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
        consoleLogLevel = 3;
        kernelPackages = pkgs.linuxPackagesFor (
          pkgs.linux_zen.override {
            argsOverride = rec {
              src = pkgs.fetchFromGitHub {
                owner = "zen-kernel";
                repo = "zen-kernel";
                rev = "v${version}";
                hash = "sha256-pRyeC6KbFWDz3unnbAyLSEdizv2/504hjQvmE+4uhoc=";
              };
              version = "7.2.15-zen1";
              modDirVersion = version;
            };
          }
        );
      };
    };
}
