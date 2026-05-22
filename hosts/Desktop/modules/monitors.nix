{ self, ... }:
{
  flake.nixosModules.hostsDesktopModulesMonitors = {
    config.monitors = [
      {
        name = "eDP-1";
        width = 1920;
        height = 1080;
        refreshRate = 60;
        x = 0;
        y = 0;
        enabled = false;
      }
      {
        name = "HDMI-A";
        width = 3440;
        height = 1440;
        refreshRate = 100;
        x = 0;
        y = 0;
        enabled = true;
      }
    ];
  };
}
