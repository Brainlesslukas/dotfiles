{ ... }:
{
  flake.nixosModules.coreProgramsMonitoringResources =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.resources
      ];
    };
}
