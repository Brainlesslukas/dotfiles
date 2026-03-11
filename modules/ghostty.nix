{ pkgs, ... }:

{
  home-manager.users.lukas = {
    programs.ghostty = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        font-size = 14;
        background-opacity = 0.7;
        background-blur = 1;
        copy-on-select = true;
        window-padding-color = "extend";
      };
    };
  };
}
