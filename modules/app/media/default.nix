{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppMedia =
    {
      config,
      pkgs,
      lib,
      ...
    }:
    let
      inherit (lib) mkEnableOption mkIf;
    in

    {
      imports = [ inputs.spicetify-nix.nixosModules.default ];

      options.programs.media = {
        enable = mkEnableOption "Enables media modules";
      };

      config = mkIf config.programs.media.enable {
        programs.spicetify =
          let
            spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
          in
          {
            enable = true;
          };

        environment.systemPackages = with pkgs; [
          vlc
          obs-studio
        ];
      };
    };
}
