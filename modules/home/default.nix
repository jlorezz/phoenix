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
         # imports = [./shell.nix ./code.nix];

        home = {
          inherit username;
          homeDirectory = "/home/${username}";
          stateVersion = "24.05";
          packages = [
            pkgs.curl
            pkgs.wget
            pkgs.zip
            pkgs.unzip
          ];
          file."wallpapers" = {
            recursive = true;
            source = ./wallpapers;
          };
        };

        programs.home-manager.enable = true;
        services.ssh-agent.enable = true;
      }
    ];
  };
}
