{ self, inputs, ... }:
{
  flake.nixosModules.coreProgramsMonitoringWireshark =
    { pkgs, ... }:
    {
      programs.wireshark = {
        enable = true;
        package = pkgs.wireshark;
      };
    };
}
