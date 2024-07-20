{
  inputs,
  username,
  sshPubKey,
  ...
}: {
  flake.nixosConfigurations = let
    systemConfig = system: modules:
      inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs username sshPubKey;};
        inherit system;
        modules =
          [
            ../nixos/system.nix
            ../home
          ]
          ++ modules;
      };
  in {
    wsl = systemConfig "x86_64-linux" [../../hosts/wsl.nix];
    nas = systemConfig "x86_64-linux" [../../hosts/nas];
  };
}
