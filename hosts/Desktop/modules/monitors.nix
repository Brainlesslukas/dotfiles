{ self, ... }:
{
  flake.nixosModules.hostsDesktopModulesMonitors = {
    config.monitors = [
      {
        name = "HDMI-A-1";
        width = 1920;
        height = 1080;
        refreshRate = 60;
        x = 0;
        y = 0;
        enabled = true;
      }
      {
        name = "DP-1";
        width = 1920;
        height = 1080;
        refreshRate = 100;
        x = 1920;
        y = 0;
        enabled = true;
      }
    ];
  };
}
