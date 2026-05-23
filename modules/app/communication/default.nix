{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppCommunication =
    { pkgs, config, ... }:
    let
      inherit (config.userOptions) userName;
    in
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];

      nixpkgs.config.allowUnfree = true;
      environment.systemPackages = with pkgs; [
        teamspeak6-client
      ];

      home-manager.users.${userName} = {
        programs.vesktop = {
          enable = true;
        };
      };
    };
}
