{ self, inputs, ... }:
{

  flake.nixosModules.modulesDesktopVicinae =
    { pkgs, config, ... }:
    let
      inherit (config.userOptions) userName;
    in

    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager.users.${userName} = {
        programs.vicinae = {
          enable = true;
          systemd = {
            enable = true;
            autoStart = true;
          };
          settings = {
            search_files_in_root = false;
          };
          extensions = with inputs.vicinae-extensions.packages.${pkgs.stdenv.hostPlatform.system}; [
            nix
          ];
        };
      };
    };
}
