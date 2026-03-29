{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppVscode =
    { pkgs, ... }:
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager.users.lukas = {
        nixpkgs.config.allowUnfree = true;
        programs.vscode.enable = true;
      };
    };
}
