{ self, inputs, ... }:
{

  flake.nixosModules.coreProgramsUtilsNeovim =
    { config, pkgs, ... }:
    {
      programs.neovim = {
        enable = true;
      };
    };
}
