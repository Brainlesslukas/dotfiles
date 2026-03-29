{ ... }:
{
  flake.nixosModules.modulesSecurityAuth =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.bitwarden-desktop
      ];
    };
}
