{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.modulesShell = {
    pkgs,
    config,
    ...
  }: let
    inherit (config.userOptions) userName;
  in {
    imports = [
      self.nixosModules.modulesShellZsh
      self.nixosModules.modulesShellP10k
      inputs.home-manager.nixosModules.home-manager
    ];
    environment.systemPackages = with pkgs; [
      bat
      zoxide
      unzip
      statix
      eza
      gcc
      wtype
      alejandra
    ];

    home-manager.users.${userName} = {
      programs.git = {
        enable = true;
        settings = {
          push.autoSetupRemote = true;
          user = {
            name = "brainlesslukas";
            email = "hello@brainlesslukas.com";
          };
        };
      };
    };
  };
}
