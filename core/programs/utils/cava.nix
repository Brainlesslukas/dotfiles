{ ... }:
{
  flake.nixosModules.coreProgramsUtilsCava =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.cava
      ];
    };
}
