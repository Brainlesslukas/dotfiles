{ self, ... }:
{
  flake.nixosModules.modulesAppIllustartion =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.inkscape
      ];
    };
}
