{ self, inputs, ... }:
{
  flake.nixosModules.modulesAppDevelopment =
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

      options.programs.development = {
        enable = mkEnableOption "Enables development modules";
      };

      config = mkIf config.programs.development.enable {
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
    };
}
