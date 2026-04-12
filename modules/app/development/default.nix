{ self, ... }:
{
  flake.nixosModules.modulesAppDevelopment =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.postman
      ];
    };
}
