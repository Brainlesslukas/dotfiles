{ ... }:
{
  flake.nixosModules.coreProgramsMonitoringBtop =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.btop
      ];
    };
}
