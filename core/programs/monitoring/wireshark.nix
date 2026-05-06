{ self, inputs, ... }:
{
  flake.nixosModules.coreProgramsMonitoringWireshark =
    { pkgs, config, ... }:
    let
      inherit (config.userOptions) userName;
    in
    {
      programs.wireshark = {
        enable = true;
        package = pkgs.wireshark;
      };
      users.users.${userName}.extraGroups = [ "wireshark" ];
    };
}
