{ pkgs, ... }:

{
  home-manager.users.lukas = {
    services.polybar = {
      enable = true;
    };
  };
}
