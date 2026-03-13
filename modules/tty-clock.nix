{ pkgs, ... }:

{
  home-manager.users.lukas = {
    programs.tty-clock = {
      enable = true;
    };
  };
}

