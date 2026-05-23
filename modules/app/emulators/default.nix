{ self, inputs, ... }:
{
  flake.nixosModules.modulesAppEmulators =
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
      options.programs.emulators = {
        enable = mkEnableOption "Enables emulator modules";
      };

      config = mkIf config.programs.emulators.enable {
        virtualisation.docker.enable = true;
        users.users.${userName}.extraGroups = [ "docker" ];
      };
    };
}
