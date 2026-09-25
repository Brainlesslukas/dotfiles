{ self, ... }:
{
  flake.nixosModules.coreHardwareNetwork =
    { config, lib, pkgs, ... }:
    let
      inherit (config.userOptions) userName hostName;
    in
    {
      networking = {
        inherit hostName;
        firewall = {
          checkReversePath = false;
          allowedUDPPorts = [ 53 67 ]; # Hotspot
        };
        networkmanager.enable = true;
      };
      users.users.${userName}.extraGroups = [ "networkmanager" ];
      environment.systemPackages = [ pkgs.iw ];
    };
}
