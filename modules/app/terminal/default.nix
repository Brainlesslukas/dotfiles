{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppTerminal =
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

      options.programs.terminal = {
        enable = mkEnableOption "Enables terminal modules";
      };

      config = mkIf config.programs.terminal.enable {
        home-manager.users.${userName} = {
          programs.ghostty = {
            enable = true;
            enableZshIntegration = true;
            settings = {
              font-size = 14;
              background-opacity = 0.7;
              background-blur = 1;
              window-padding-color = "extend";
            };
          };
        };
      };
    };
}
