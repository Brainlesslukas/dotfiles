{ self, ... }:
{
  flake.nixosModules.modulesSecurity = {
    imports = [
      self.nixosModules.modulesSecurityVpn
      self.nixosModules.modulesSecurityEncryption
    ];
  };
}
