{ self, ... }:
{
  flake.nixosModules.modulesAppAi =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        ollama
        claude-code
      ];
    };
}
