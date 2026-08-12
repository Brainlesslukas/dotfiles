{ self, inputs, ... }:
{

  flake.nixosModules.modulesDesktopFlameshot =
    { pkgs, config, ... }:
    let
      inherit (config.userOptions) userName;
    in
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager.users.${userName} = {
        services.flameshot = {
          enable = true;
        };
      };
    };
}
