{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppProductivity =
    { pkgs, config, ... }:
    let
      inherit (config.userOptions) userName;
    in
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager.users.${userName} = {
        nixpkgs.config.allowUnfree = true;
        programs.obsidian.enable = true;
      };
    };
}
