{ ... }:
{
  flake.nixosModules.coreProgramsUtilsTtyclock =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.tty-clock
      ];
    };
}
