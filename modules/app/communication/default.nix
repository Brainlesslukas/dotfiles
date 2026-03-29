{ self, ... }:
{
  flake.nixosModules.modulesAppCommunication = {
    imports = [
      self.nixosModules.modulesAppCommunicationTeamspeak
      self.nixosModules.modulesAppCommunicationVesktop
    ];
  };
}
