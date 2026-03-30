{ self, ... }:
{
  flake.nixosModules.modulesShell = {
    imports = [
      self.nixosModules.modulesShellZsh
    ];
    environment.systemPackages = with pkgs; [
      bat
      zoxide
    ];
  };
}
