{ ... }:
{
  flake.nixosModules.modulesSecurityEncryption =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.bitwarden-desktop
      ];
    };
}
