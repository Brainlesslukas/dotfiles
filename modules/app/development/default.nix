{ self, ... }:
{
  flake.nixosModules.modulesAppDevelopment =
    { pkgs, config, ... }:
    let
      inherit (config.userOptions) userName;
    in
    {
      environment.systemPackages = [
        pkgs.postman
      ];

      virtualisation.docker.enable = true;
      users.users.${userName}.extraGroups = [ "docker" ];
    };
}
