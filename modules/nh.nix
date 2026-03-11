{ config, pkgs, ... }:

{
  programs.nh = {
    enable = true;
    flake = "/home/lukas/dotfiles";
  };
}
