{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppVicinae =
    { pkgs, ... }:

    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager.users.lukas = {
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
