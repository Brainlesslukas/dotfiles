{ self, ... }:
{
  flake.nixosModules.modulesApp = {
    imports = [
      self.nixosModules.modulesAppTerminal
      self.nixosModules.modulesAppBrowsing
      self.nixosModules.modulesAppCommunication
      self.nixosModules.modulesAppMedia
      self.nixosModules.modulesAppAi
      self.nixosModules.modulesAppDevelopment
      self.nixosModules.modulesAppProductivity
      self.nixosModules.modulesAppGaming
      self.nixosModules.modulesAppEmulators
    ];
  };
}
