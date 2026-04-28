{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppObsidian =
    { pkgs, ... }:
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager.users.lukas = {
        nixpkgs.config.allowUnfree = true;
        programs.obsidian.enable = true;
      };
    };
}
