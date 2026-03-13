{ pkgs, ... }:

{
  home-manager.users.lukas = {
    services.yazi = {
      enable = true;    
    };
  };
}
