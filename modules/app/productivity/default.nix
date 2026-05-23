{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppProductivity =
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

      options.programs.productivity = {
        enable = mkEnableOption "Enables productivity modules";
      };

      config = mkIf config.programs.productivity.enable {
        home-manager.users.${userName} = {
          nixpkgs.config.allowUnfree = true;
          programs.obsidian.enable = true;
        };
      };
    };
}
