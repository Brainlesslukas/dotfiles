_: {
  flake.nixosModules.coreProgramsUtilsRipgrep =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.ripgrep
      ];
    };
}
