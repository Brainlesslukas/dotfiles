{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppCommunicationElement = # Matrix
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        element-desktop
      ];
    };
}
