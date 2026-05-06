{ self, ... }:
{
  flake.nixosModules.coreHardwareNetwork =
    { config, lib, ... }:
    let
      inherit (config.userOptions) userName hostName;
    in
    {
      networking = {
        inherit hostName;
        firewall.checkReversePath = false;
        networkmanager.enable = true;
      };
      users.users.${userName}.extraGroups = [ "networkmanager" ];
    };
}
