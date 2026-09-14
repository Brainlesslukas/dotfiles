{ self, ... }:
{
  flake.nixosModules.hostsDesktopModulesServices = { 
    services.CtrlpadDaemon.enable = true;
  };
}
