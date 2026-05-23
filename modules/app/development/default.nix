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

        home-manager.users.${userName} = {
          nixpkgs.config.allowUnfree = true;
          programs.vscode = {
            enable = true;
            profiles.default.extensions = with pkgs.vscode-extensions; [
              # im using VSC only for platformio so there are not many extensions :)
              jdinhlife.gruvbox
              oderwat.indent-rainbow
              pkief.material-icon-theme
              platformio.platformio-vscode-ide
              esbenp.prettier-vscode
              asvetliakov.vscode-neovim
            ];
          };
        };
      };
    };
}
