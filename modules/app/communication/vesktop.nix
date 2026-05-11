{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppCommunicationVesktop =
    { pkgs, config, ... }:
    let
      inherit (config.userOptions) userName;
    in
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager.users.${userName} = {
        programs.vesktop = {
          enable = true;
        };
      };
    };
}
