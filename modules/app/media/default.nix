{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppMedia =
    { config, pkgs, ... }:

    {
      imports = [ inputs.spicetify-nix.nixosModules.default ];
      programs.spicetify = {
        enable = true;
      };
    };
}
