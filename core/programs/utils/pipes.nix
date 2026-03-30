{ ... }:
{
  flake.nixosModules.coreProgramsUtilsPipes =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.pipes
      ];
    };
}
