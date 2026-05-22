{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppCommunicationTeamspeak =
    { pkgs, ... }:
    {
      nixpkgs.config.allowUnfree = true;
      environment.systemPackages = with pkgs; [
        teamspeak6-client
      ];
    };
}
