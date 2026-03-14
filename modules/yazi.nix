{ pkgs, ... }:

{
  home-manager.users.lukas = {
    programs.yazi = {
      enable = true;
    };
  };
}
