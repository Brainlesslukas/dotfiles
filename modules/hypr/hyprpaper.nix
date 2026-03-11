{ pkgs, ... }:

{
 home-manager.users.lukas = {
  services.hyprpaper = {
    enable = true;
  }
 }
}
