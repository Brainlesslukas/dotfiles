{ self, inputs, ... }:
{

  flake.nixosModules.modulesAppBrowsingZenbrowser =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    let
      inherit (lib) mkEnableOption mkIf;
      extension = shortId: guid: {
        name = guid;
        value = {
          install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
          installation_mode = "normal_installed";
        };
      };
      prefs = {
        "extensions.autoDisableScopes" = 15;
        "extensions.pocket.enabled" = false;
      };
      extensions = [
        (extension "bitwarden-password-manager" "{446900e4-71c2-419f-a6a7-df9c091e268b}")
        (extension "return-youtube-dislikes" "{762f9885-5a13-4abd-9c77-433dcd38b8fd}")
        (extension "material-icons-for-github" "{eac6e624-97fa-4f28-9d24-c06c9b8aa713}")
      ];
    in
    {
      options.programs.browsing.zen = {
        enable = mkEnableOption "Zen Browser";
      };

      config = mkIf config.programs.browsing.zen.enable {
        environment.systemPackages = with pkgs; [
          (pkgs.wrapFirefox
            inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.zen-browser-unwrapped
            {
              extraPolicies = {
                ExtensionSettings = builtins.listToAttrs extensions;
                DisableTelemetry = true;
                AutofillAddressEnabled = false;
                AutofillCreditCardEnabled = false;
                OfferToSaveLogins = false;
                PasswordManagerEnabled = false;

                SearchEngines = {
                  Default = "ddg";
                  Add = [
                    {
                      Name = "NixOS options";
                      URLTemplate = "https://home-manager-options.extranix.com/?query={searchTerms}&release=master";
                      IconURL = "https://wiki.nixos.org/favicon.ico";
                      Alias = "@no";
                    }
                    {
                      Name = "nixpkgs packages";
                      URLTemplate = "https://search.nixos.org/packages?query={searchTerms}";
                      IconURL = "https://wiki.nixos.org/favicon.ico";
                      Alias = "@np";
                    }
                  ];
                };
              };
            }
          )
        ];
      };
    };
}
