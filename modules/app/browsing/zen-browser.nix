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
        "layout.spellcheckDefault" = 1;
        "media.webrtc.camera.allow-pipewire" = true;
        "browser.download.always_ask_before_handling_new_types" = true;
        "widget.use-xdg-desktop-portal.file-picker" = 1;
        "browser.discovery.enabled" = false;
        "app.shield.optoutstudies.enabled" = false;
        "browser.topsites.contile.enabled" = false;
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;
        "browser.urlbar.trending.featureGate" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.snippets" = false;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeVisited" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.system.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.link.open_newwindow" = 3;
        "browser.link.open_newwindow.restriction" = 0;
        "privacy.resistFingerprinting" = true;
        "browser.safebrowsing.downloads.remote.enabled" = false;
        "network.dns.disablePrefetch" = true;
        "network.predictor.enabled" = false;
        "network.http.speculative-parallel-limit" = 0;
        "browser.places.speculativeConnect.enabled" = false;
        "privacy.globalprivacycontrol.enabled" = true;
        "privacy.clearOnShutdown_v2.cookiesAndStorage" = true;
        "privacy.fingerprintingProtection" = true;
        "browser.contentblocking.category" = "strict";
        "extensions.pocket.enabled" = false;
        "browser.search.suggest.enabled" = false;
        "browser.search.suggest.enabled.private" = false;
        "browser.urlbar.suggest.searches" = false;
        "browser.privatebrowsing.forceMediaMemoryCache" = true;
        "network.http.referer.XOriginTrimmingPolicy" = 2;
        "security.csp.reporting.enabled" = false;
        "pdfjs.enableScripting" = false;
        "signon.formlessCapture.enabled" = false;
        "dom.disable_window_move_resize" = true;
        "devtools.debugger.remote-enabled" = false;
        "extensions.enabledScopes" = 5;
        "security.ssl.require_safe_negotiation" = true;
        "security.tls.enable_0rtt_data" = false;
        "security.cert_pinning.enforcement_level" = 2;
        "security.pki.crlite_mode" = 2;
        "security.ssl.treat_unsafe_negotiation_as_broken" = true;
        "browser.xul.error_pages.expert_bad_cert" = true;
        "browser.startup.page" = 1;
        "browser.sessionstore.resume_from_crash" = false;
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
              extraPrefs = lib.concatLines (
                lib.mapAttrsToList (
                  name: value: "lockPref(${lib.strings.toJSON name}, ${lib.strings.toJSON value});"
                ) prefs
              );

              extraPolicies = {
                ExtensionSettings = builtins.listToAttrs extensions;
                DisableTelemetry = true;
                AutofillAddressEnabled = false;
                AutofillCreditCardEnabled = false;
                SSLVersionMin = "tls1.2";
                PostQuantumKeyAgreementEnabled = true;
                EnableTrackingProtection = {
                  Value = true;
                  Locked = true;
                  Cryptomining = true;
                  Fingerprinting = true;
                  Exceptions = [
                    "https://netflix.com"
                    "https://amazon.de"
                    "https://spotify.com"
                  ];
                };
                DisablePocket = true;
                NetworkPrediction = false;
                OfferToSaveLogins = false;
                PasswordManagerEnabled = false;
                DontCheckDefaultBrowser = true;
                UserMessaging = {
                  ExtensionRecommendations = false;
                  UrlbarInterventions = false;
                  SkipOnboarding = true;
                  MoreFromMozilla = false;
                  FirefoxLabs = true;
                };
                SanitizeOnShutdown = {
                  Cache = true;
                  FormData = true;
                  SiteSettings = true;
                  OfflineApps = true;
                };
                Cookies = {
                  Allow = [
                    "https://github.com"
                    "https://gitlab.com"
                    "https://codeberg.org"
                  ];
                };

                SearchEngines = {
                  Remove = [
                    "eBay"
                    "Google"
                    "Bing"
                    "Ecosia"
                    "Wikipedia"
                    "Perplexity"
                  ];
                  Add = [
                    {
                      "Name" = "Qwant";
                      "URLTemplate" = "https://www.qwant.com/?q={searchTerms}";
                      "Alias" = "qwant";
                    }
                  ];
                  Default = "Qwant";
                };
              };
            }
          )
        ];
      };
    };
}
