{ self, ... }:
{
  flake.nixosModules.modulesSecurity = {
    imports = [
      self.nixosModules.modulesSecurityVpn
    ];
  };
}
