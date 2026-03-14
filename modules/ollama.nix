{ pkgs, ... }:

{
  home-manager.users.lukas = {
    services.ollama = {
      enable = true;
    };
  };
}
