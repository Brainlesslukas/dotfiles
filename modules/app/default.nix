{ self, ... }:
{
  flake.nixosModules.modulesApp = {
    imports = [
      self.nixosModules.modulesAppGhostty
      self.nixosModules.modulesAppGit
      self.nixosModules.modulesAppSpicetify
      self.nixosModules.modulesAppVicinae
      self.nixosModules.modulesAppVscode
      self.nixosModules.modulesAppBrowsing
      self.nixosModules.modulesAppCommunication
    ];
  };
}
