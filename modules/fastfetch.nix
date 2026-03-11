{ pkgs, ... }:

{
  home-manager.users.lukas = {
    programs.fastfetch = {
      enable = true;
      settings = {
        logo = {
          source = "nixos_small";
        };
        modules = [
          {
            type = "os";
            format = "I use {pretty-name} btw.";
          }
          {
            type = "wm";
            format = "{pretty-name} {version}";
          }
          {
            type = "kernel";
            format = "{sysname} {release}";
          }
          {
            type = "disk";
            key = "Disk";
            format = "{size-used} / 500GiB";
          }
          {
            type = "memory";
            key = "RAM";
            format = "{used} / 16GiB";
          }
          {
            type = "packages";
            format = "{all}";
          }
          {
            type = "uptime";
            format = "{formatted}";
          }
        ];
      };
    };
  };
}
