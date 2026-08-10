{
  nixConfig = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ctrlpad-daemon = {
      url = "github:ctrlpad/daemon";
    };
    ctrlpad-desktop = {
      url = "github:ctrlpad/desktop";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vicinae = {
      url = "github:vicinaehq/vicinae";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vicinae-extensions = {
      url = "github:vicinaehq/extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell/cachix";
    };
    nix-snapd = {
      url = "github:nix-community/nix-snapd";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord.url = "github:FlameFlag/nixcord";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } (
      { ... }:
      {
        imports = [
          (inputs.import-tree ./hosts)
          (inputs.import-tree ./modules)
          (inputs.import-tree ./core)
          (inputs.import-tree ./assets)
          (inputs.import-tree ./users)
        ];
      }
    );
}
