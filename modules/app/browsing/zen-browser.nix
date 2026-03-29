{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppBrowsingZenbrowser =
    { pkgs, ... }:

    {
      environment.systemPackages = with pkgs; [
        inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    };
}
