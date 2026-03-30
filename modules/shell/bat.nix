{ self, inputs, ... }:
{

  flake.nixosModules.modulesShellBat =
    { config, pkgs, ... }:
    {
      programs.bat = {
        enable = true;
      };
    };
}
