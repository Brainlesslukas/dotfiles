{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppGit =
    { pkgs, ... }:

    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      environment.systemPackages = [
        pkgs.github-desktop
      ];
      home-manager.users.lukas = {
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
