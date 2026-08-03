{ self, inputs, ... }:
{
  flake.nixosModules.coreServicesSnap = {
    imports = [ inputs.nix-snapd.nixosModules.default ];
    services.snap.enable = true;
  };
}
