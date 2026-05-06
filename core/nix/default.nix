{ self, ... }:
{
  flake.nixosModules.coreNix =
    { pkgs, ... }:
    {
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
        nix-ld.enable = true;
        direnv = {
          enable = true;
          nix-direnv.enable = true;
        };
      };
    };
}
