{ self, ... }:
{
  flake.nixosModules.coreServicesUpower = 
  { lib, config, ... }: 
  let
    inherit (lib) mkEnableOption mkIf;
  in 
  {
    options.services.upower = {
      enable = mkEnableOption "Enables upower service"
    };
    
    config = mkIf config.services.upower.enable {
      services.upower.enable = true;
    };
  };
}
