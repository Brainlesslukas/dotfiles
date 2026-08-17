{ self, ... }:
{
  flake.nixosModules.modulesSecurity = {
    imports = [
      self.nixosModules.modulesSecurityVpn
      self.nixosModules.modulesSecurityEncryption
    ];
    security = {
      sudo.enable = false;
      sudo-rs = {
        enable = true;
        execWheelOnly = true;
        wheelNeedsPassword = true;
      };
    };
  };
}
