{
  lib,
  pkgs,
  inputs,
  username,
  sshPubKey,
  ...
}:
with lib; {

  environment.variables.EDITOR = mkDefault "nano";
  environment.systemPackages = with pkgs; [alejandra nil];
  # environment.sessionVariables = {
  #   PODMAN_IGNORE_CGROUPSV1_WARNING = 1;
  # };

  networking.hostName = mkDefault "nixos";
  system.stateVersion = mkDefault "24.05";
  time.timeZone = mkDefault "Europe/Berlin";
  i18n.defaultLocale = mkDefault "en_GB.UTF-8";

  programs.zsh = {
    enable = true;
  };

  services = {
    tailscale.enable = mkDefault true;
    openssh = mkDefault {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
      };
      hostKeys = [
        {
          path = "/etc/ssh/ssh_host_ed25519_key";
          type = "ed25519";
        }
      ];
    };
  };

  users = {
    mutableUsers = false;
    users.${username} = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
      ];
      shell = pkgs.zsh;
      hashedPassword = "$6$NjIbvQqK1EIbSjs4$x9BYXM8xsfxQKg/Ct.SM6MiYb0t1bvWxwWv33s/th8KQkrSKegb0J/aYFXDq1B7p7b2rsmgJKS559bZ3vx4TS1";
      openssh.authorizedKeys.keys = [sshPubKey];
    };
  };

  security.sudo.wheelNeedsPassword = mkDefault false;
  security.sudo.execWheelOnly = mkDefault true;

  nixpkgs.config.allowUnfree = mkDefault true;
  nix = {
    gc = mkDefault {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
      accept-flake-config = true;
      trusted-users = ["root" "@wheel"];
      substituters = [
        "https://nix-community.cachix.org"
        "https://cache.nixos.org/"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };

    package = pkgs.nixVersions.latest;
  };
}
