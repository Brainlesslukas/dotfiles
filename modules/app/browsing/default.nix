{ self, ... }:
{
  flake.nixosModules.modulesAppBrowsing = {
    imports = [
      self.nixosModules.modulesAppBrowsingZenbrowser
      self.nixosModules.modulesAppBrowsingFirefox
    ];
  };
}
