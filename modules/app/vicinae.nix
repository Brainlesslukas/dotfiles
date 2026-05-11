{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppVicinae =
    { pkgs, config, ... }:
    let
      inherit (config.userOptions) userName;
    in

    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager.users.${userName} = {
        programs.vicinae = {
          enable = true;
          systemd = {
            enable = true;
            autoStart = true;
          };
        };
      };
    };
}
