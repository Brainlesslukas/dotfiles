{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppCommunicationVesktop =
    { pkgs, ... }:
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager.users.lukas = {
        programs.vesktop = {
          enable = true;
        };
      };
    };
}
