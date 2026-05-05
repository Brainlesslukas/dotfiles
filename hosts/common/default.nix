{ self, ... }:
{
  flake.nixosModules.hostsCommon = {
    imports = [
      self.nixosModules.hostsCommonLocale
    ];
  };
}
