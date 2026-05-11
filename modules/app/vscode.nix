{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppVscode =
    { pkgs, config, ... }:
    let
      inherit (config.userOptions) userName;
    in
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager.users.${userName} = {
        nixpkgs.config.allowUnfree = true;
        programs.vscode.enable = true;
      };
    };
}
