{ self, inputs, ... }:
{
  flake.nixosModules.modulesDesktopStylix =
    {
      config,
      pkgs,
      lib,
      ...
    }:

    {
      imports = [
        inputs.home-manager.nixosModules.home-manager
        inputs.stylix.nixosModules.stylix
      ];

      # System-level Stylix configuration
      stylix = {
        enable = true;

        # Base16 color scheme from the tinted-theming/schemes repository
        # Available schemes: https://github.com/tinted-theming/schemes
        base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

        # Cursor theme configuration
        cursor = {
          package = pkgs.bibata-cursors;
          name = "Bibata-Modern-Ice";
          size = 25;
        };

        # Font configuration for the entire system
        # Stylix will apply these fonts to all compatible applications
        fonts = {
          emoji = {
            package = pkgs.noto-fonts-color-emoji;
            name = "Noto Color Emoji";
          };
          monospace = {
            package = pkgs.nerd-fonts.geist-mono;
            name = "Geist Mono";
          };
          sansSerif = {
            package = pkgs.geist-font;
            name = "Geist";
          };
          # Use same font for serif as sans-serif for consistency
          serif = config.stylix.fonts.sansSerif;

          # Font sizes for different UI elements
          sizes = {
            applications = 12; # General application text
            desktop = 10; # Desktop environment elements
            popups = 10; # Notification popups
            terminal = 10; # Terminal emulator text
          };
        };

        # Color polarity (dark mode)
        polarity = "dark";

        #targets.neovim.enable = false;
      };

      # User-level Stylix configuration (via Home Manager)
      home-manager.users.lukas = {
        stylix = {
          targets.firefox.profileNames = [ "" ];
          targets.firefox.fonts.enable = lib.mkForce false;
          # Icon theme configuration
          icons = {
            enable = true;
            package = pkgs.kora-icon-theme;
            dark = "kora";
          };

          # Application transparency (0.0 = fully transparent, 1.0 = opaque)
          # Applied to compatible applications like terminals
          opacity.applications = 0.8;

          # Ensure user-level theme matches system polarity
          polarity = "dark";
        };
      };
    };
}
