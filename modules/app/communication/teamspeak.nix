{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppCommunicationTeamspeak =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        teamspeak6-client
      ];
    };
}
