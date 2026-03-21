{ pkgs, ... }:

{
  home-manager.users.lukas = {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "Lukas";
          email = "info@brainlesslukas.com";
        };
      };
      extraConfig = {
        push.autoSetupRemote = true;
      };
    };
  };
}
