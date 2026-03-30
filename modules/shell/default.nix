{ self, ... }:
{
  flake.nixosModules.modulesShell =
    { pkgs, ... }:
    {
      imports = [
        self.nixosModules.modulesShellZsh
      ];
      environment.systemPackages = with pkgs; [
        bat
        zoxide
        unzip
      ];
    };
}
