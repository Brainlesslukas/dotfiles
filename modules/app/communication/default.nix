{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppCommunication =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    let
      inherit (config.userOptions) userName;
      inherit (lib) mkEnableOption mkIf;
    in
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];

      options.programs.communication = {
        enable = mkEnableOption "Enables communication modules";
      };

      config = mkIf config.programs.communication.enable {
        nixpkgs.config.allowUnfree = true;

        environment.systemPackages = with pkgs; [
          teamspeak6-client
        ];

        home-manager.users.${userName} = {
          imports = [ inputs.nixcord.homeModules.nixcord ];
          programs.nixcord = {
            enable = true;
            discord.vencord.enable = false;
            vesktop.enable = true;
            config.plugins = {
              fakeNitro.enable = true;
              gameActivityToggle.enable = true;
              permissionsViewer.enable = true;
              showMeYourName.enable = true;
              friendsSince.enable = true;
              mentionAvatars.enable = true;
              messageLogger.enable = true;
              relationshipNotifier.enable = true;
              silentTyping.enable = true;
              spotifyControls.enable = true;
              whoReacted.enable = true;
            };
          };
        };
      };
    };
}
