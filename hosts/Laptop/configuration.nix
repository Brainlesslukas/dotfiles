{ self, inputs, ... }:
{

  flake.nixosModules.LaptopConfig = {
    services.logind.settings.Login.HandleLidSwitch = "ignore";
  };
}
