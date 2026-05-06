{ self, ... }:
{
  flake.nixosModules.usersLukas =
    { pkgs, ... }:
    {
      users = {
        users.lukas = {
          initialPassword = "secure123";
          isNormalUser = true;
          extraGroups = [
            "networkmanager"
            "wheel"
            "docker"
            "wireshark"
          ];
          shell = pkgs.zsh;
        };
        defaultUserShell = pkgs.zsh;
      };
    };
}
