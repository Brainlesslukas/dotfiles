{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppBrowsingFirefox =
    { pkgs, config, ... }:
    let
      inherit (config.userOptions) userName;
    in

    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager.users.${userName} = {
        programs.firefox.enable = true;
      };
    };
}
