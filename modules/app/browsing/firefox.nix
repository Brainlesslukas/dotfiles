{self, ...}: {
  flake.nixosModules.modulesAppBrowsingFirefox = {
    pkgs,
    lib,
    config,
    ...
  }: let
    inherit (lib) mkEnableOption mkIf;
  in {
    options.programs.browsing.firefox = {
      enable = mkEnableOption "Firefox Browser";
    };

    config = mkIf config.programs.browsing.firefox.enable {
      environment.systemPackages = with pkgs; [
        firefox
      ];
    };
  };
}
