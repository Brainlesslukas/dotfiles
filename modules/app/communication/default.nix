{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppCommunication =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    let
      inherit (config.userOptions) userName;
      inherit (lib) mkEnableOption mkIf;
    in
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];

      options.programs.communication = {
        enable = mkEnableOption "Enables communication modules";
      };

      config = mkIf config.programs.communication.enable {
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
    };
}
