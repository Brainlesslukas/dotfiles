{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppSpicetify =
    { config, pkgs, ... }:

    {
      imports = [ inputs.spicetify-nix.nixosModules.default ];
      programs.spicetify = {
        enable = true;
      };
    };
}
