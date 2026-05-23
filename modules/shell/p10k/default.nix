{ self, ... }:
{
  flake.nixosModules.modulesShellP10k =
    { config, ... }:
    let
      inherit (config.userOptions) userName;
    in
    {
      home-manager.users.${userName} = {
        home.file."/home/${userName}/.config/zsh/.p10k.zsh" = {
          source = ./.p10k.zsh;
        };
      };
    };
}
