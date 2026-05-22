{ self, inputs, ... }:
{
  flake.nixosModules.modulesAppDevelopment =
    { pkgs, config, ... }:
    let
      inherit (config.userOptions) userName;
    in
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];

      environment.systemPackages = with pkgs; [
        postman
        github-desktop
      ];

      virtualisation.docker.enable = true;
      users.users.${userName}.extraGroups = [ "docker" ];

      home-manager.users.${userName} = {
        nixpkgs.config.allowUnfree = true;
        programs.vscode.enable = true;

      };
    };
}
