{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppGit =
    { pkgs, config, ... }:
    let
      inherit (config.userOptions) userName;
    in

    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      environment.systemPackages = [
        pkgs.github-desktop
      ];
      home-manager.users.${userName} = {
        programs.git = {
          enable = true;
          settings = {
            push.autoSetupRemote = true;
            user = {
              name = "Lukas";
              email = "info@brainlesslukas.com";
            };
          };
        };
      };
    };
}
