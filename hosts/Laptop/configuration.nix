{ self, inputs, ... }:
{

  flake.nixosModules.LaptopConfig =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    {
      # Bootloader.
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      networking.hostName = "Laptop"; # Define your hostname.
      # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

      # Configure network proxy if necessary
      # networking.proxy.default = "http://user:password@proxy:port/";
      # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

      # Enable networking
      networking.networkmanager.enable = true;
      networking.firewall.checkReversePath = false;

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      # Set your time zone.
      time.timeZone = "Europe/Berlin";

      # Select internationalisation properties.
      i18n.defaultLocale = "en_US.UTF-8";

      i18n.extraLocaleSettings = {
        LC_ADDRESS = "de_DE.UTF-8";
        LC_IDENTIFICATION = "de_DE.UTF-8";
        LC_MEASUREMENT = "de_DE.UTF-8";
        LC_MONETARY = "de_DE.UTF-8";
        LC_NAME = "de_DE.UTF-8";
        LC_NUMERIC = "de_DE.UTF-8";
        LC_PAPER = "de_DE.UTF-8";
        LC_TELEPHONE = "de_DE.UTF-8";
        LC_TIME = "de_DE.UTF-8";
      };

      programs.nix-ld.enable = true;

      environment.variables = {
        XDG_CURRENT_DESKTOP = "Hyprland";
        XDG_SESSION_DESKTOP = "Hyprland";
        GTK_USE_PORTAL = "1";
        GDK_BACKEND = "wayland,x11";
        QT_QPA_PLATFORM = "wayland";
      };

      # Configure keymap in X11
      services.xserver.xkb = {
        layout = "de";
        variant = "";
      };

      # Configure console keymap
      console.keyMap = "de";

      # Define a user account. Don't forget to set a password with ‘passwd’.
      users = {
        users.lukas = {
          isNormalUser = true;
          description = "Lukas";
          extraGroups = [
            "networkmanager"
            "wheel"
            "docker"
          ];
          shell = pkgs.zsh;
          packages = with pkgs; [ ];
        };
        defaultUserShell = pkgs.zsh;
      };

      # Allow unfree packages
      nixpkgs.config.allowUnfree = true;

      # List packages installed in system profile. To search, run:
      # $ nix search wget
      environment.systemPackages = with pkgs; [
        neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
        wget
        teamspeak6-client
        firefox
        zoxide
        tirith
        vesktop
        tty-clock
        nodejs
        bat
        pipes
        wireguard-tools
        protonvpn-gui
        gcc
        gnumake
        binutils
        gopls
        gotools
        revive
        delve
        veracrypt
        arduino-ide
        vscode
        nmap
      ];

      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
      };

      nix = {
        package = pkgs.nixVersions.latest;
        nixPath = [ "nixpkgs=/run/current-system/nixpkgs/" ];
      };

      system = {
        systemBuilderCommands = ''
          ln -sv ${pkgs.path} $out/nixpkgs
        '';
      };

      programs.hyprland.enable = true;
      virtualisation.docker.enable = true;

      services.logind.settings.Login.HandleLidSwitch = "ignore";

      # Some programs need SUID wrappers, can be configured further or are
      # started in user sessions.
      # programs.mtr.enable = true;
      # programs.gnupg.agent = {
      #   enable = true;
      #   enableSSHSupport = true;
      # };

      # List services that you want to enable:

      # Enable the OpenSSH daemon.
      # services.openssh.enable = true;

      # Open ports in the firewall.
      # networking.firewall.allowedTCPPorts = [ ... ];
      # networking.firewall.allowedUDPPorts = [ ... ];
      # Or disable the firewall altogether.
      # networking.firewall.enable = false;

      # This value determines the NixOS release from which the default
      # settings for stateful data, like file locations and database versions
      # on your system were taken. It‘s perfectly fine and recommended to leave
      # this value at the release version of the first install of this system.
      # Before changing this value read the documentation for this option
      # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
      system.stateVersion = "25.11"; # Did you read the comment?
    };
}
