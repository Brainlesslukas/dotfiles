{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppVscode =
    { pkgs, ... }:
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager.users.lukas = {
        programs.vscode.enable = true;
      };
    };
}
