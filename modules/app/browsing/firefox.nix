{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppBrowsingFirefox =
    { pkgs, ... }:
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager.users.lukas = {
        programs.firefox.enable = true;
      };
    };
}
