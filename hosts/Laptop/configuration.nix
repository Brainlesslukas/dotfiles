{ self, inputs, ... }:
{

  flake.nixosModules.LaptopConfig = {
    virtualisation.docker.enable = true;

    services.logind.settings.Login.HandleLidSwitch = "ignore";
  };
}
