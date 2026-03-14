{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  home-manager.users.lukas = {
    programs.claude-code = {
      enable = true;
    };
  };
}
