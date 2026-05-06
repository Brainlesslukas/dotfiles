{ self, ... }:
{
  flake.nixosModules.usersLukas =
    { pkgs, config, ... }:
    let
      inherit (config.userOptions) userName;
    in
    {
      users = {
        users.${userName} = {
          initialPassword = "secure123";
          isNormalUser = true;
          extraGroups = [
            "wheel"
          ];
          shell = pkgs.zsh;
        };
        defaultUserShell = pkgs.zsh;
      };
    };
}
