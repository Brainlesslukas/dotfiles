{ inputs, ... }:
{

  flake.nixosModules.coreHome = {
    imports = [ inputs.home-manager.nixosModules.home-manager ];
    home-manager.users.lukas = {
      home.stateVersion = "24.11";
    };
  };
}
