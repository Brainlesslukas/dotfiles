{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppGhostty =
    { pkgs, ... }:
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager.users.lukas = {
        programs.ghostty = {
          enable = true;
          enableZshIntegration = true;
          settings = {
            font-size = 14;
            background-opacity = 0.7;
            background-blur = 1;
            window-padding-color = "extend";
          };
        };
      };
    };
}
