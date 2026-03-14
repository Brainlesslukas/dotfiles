{ pkgs, ... }:

{
  home-manager.users.lukas = {
    programs.claude-code = {
      enable = true;
    };
  };
}

