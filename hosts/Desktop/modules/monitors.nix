{ self, ... }:
{
  flake.nixosModules.hostsDesktopModulesMonitors = {
    config.monitors = [
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
