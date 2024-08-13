{
  pkgs,
  inputs,
  username,
  sshPubKey,
  ...
}: {
  imports = [inputs.home-manager.nixosModules.default];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = {
      inherit inputs;
      inherit username;
      inherit sshPubKey;
    };
    sharedModules = [
      {
        imports = [./shell.nix ./code.nix ./wezterm.nix];

        home = {
          inherit username;
          homeDirectory = "/home/${username}";
          stateVersion = "24.05";
          packages = with pkgs; [curl wget zip unzip];
        };

        programs.home-manager.enable = true;
        services.ssh-agent.enable = true;
      }
    ];
  };
}
