{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppCommunicationFractal = # Matrix
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        fractal
      ];
    };
}
