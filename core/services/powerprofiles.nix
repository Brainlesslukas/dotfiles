{ self, ... }:
{
  flake.nixosModules.coreServicesPowerProfiles = 
  { lib, config, ... }: 
  let
    inherit (lib) mkEnableOption mkIf;
  in 
  {
    options.services.powerprofiles = {
      enable = mkEnableOption "Enables Powerprofile service";     
    };

    config = mkIf config.services.powerprofiles.enable {
      services.power-profiles-daemon.enable = true;
    };
  };
}
