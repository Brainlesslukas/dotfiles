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
      imports = [
        inputs.home-manager.nixosModules.home-manager
        inputs.ctrlpad-desktop.nixosModules.default
      ];

      options.programs.productivity = {
        enable = mkEnableOption "Enables productivity modules";
      };

      config = mkIf config.programs.productivity.enable {
        programs.ctrlpad-desktop.enable = true;
        environment.systemPackages = with pkgs; [
          obsidian
          onlyoffice-desktopeditors
        ];
      };
    };
}
