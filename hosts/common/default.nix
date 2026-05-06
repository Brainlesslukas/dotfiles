{ self, ... }:
{
  flake.nixosModules.hostsCommon = {
    imports = [
      self.nixosModules.hostsCommonLocale
      self.nixosModules.hostsCommonUserOptions
    ];
  };
}
