{
  inputs,
  username,
  sshPubKey,
  ...
}: {
  flake.nixosConfigurations = let
    systemConfig = modules:
      inputs.nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs username sshPubKey; };
        modules =
          [
            ../nixos/system.nix
            ../nixos/sops.nix
            ../home
          ]
          ++ modules;
      };
  in {
    wsl = systemConfig [ ../../hosts/wsl.nix ];
    nas = systemConfig [ ../../hosts/nas ];
    desktop = systemConfig [ ../../hosts/desktop ];
  };
}
