{ pkgs, ... }:

{
  home-manager.users.lukas = {
    services.vicinae = {
      enable = true;
      systemd = {
        enable = true;
        autoStart = true;
      };
    };
  };
}
