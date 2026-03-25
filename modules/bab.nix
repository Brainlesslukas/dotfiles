{ config, pkgs, ... }:

let
  bab = pkgs.callPackage /home/lukas/development/bab/default.nix {};
in
{
  environment.systemPackages = [
    bab
  ];
}
