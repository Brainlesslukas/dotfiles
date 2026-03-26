{ config, pkgs, inputs, ... }:

let
  bab-pkgs = pkgs.callPackage inputs.bab-repo {};
in
{
  environment.systemPackages = [
    bab-pkgs.bab
  ];
}
