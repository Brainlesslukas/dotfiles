{ self, inputs, ... }:
{
  flake.nixosModules.coreNix =
    { pkgs, ... }:
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];

      home-manager.users.lukas = {
        home.stateVersion = "24.11";
      };

      system = {
        stateVersion = "25.11";
        systemBuilderCommands = ''
          ln -sv ${pkgs.path} $out/nixpkgs
        '';
      };

      nix = {
        settings.experimental-features = [
          "nix-command"
          "flakes"
        ];
        package = pkgs.nixVersions.latest;
        nixPath = [ "nixpkgs=/run/current-system/nixpkgs/" ];
      };

      programs = {
        nh = {
          enable = true;
          flake = "/home/lukas/dotfiles";
        };
        direnv = {
          enable = true;
          nix-direnv.enable = true;
        };
        nix-ld.enable = true;
      };
    };
}
