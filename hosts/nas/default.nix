{
  config,
  lib,
  username,
  ...
}: {
  imports = [./hardware.nix ../../modules/nixos/docker];

  boot.loader.grub = {
    enable = true;
    device = "/dev/nvme0n1";
    useOSProber = true;
  };

  networking = {
    hostName = "nas";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [22];
      allowedUDPPorts = [config.services.tailscale.port];
    };
  };

  home-manager.users.${username} = {
    imports = [../../modules/home/git.nix];
  };

  virtualisation.docker.enable = true;

  time.timeZone = "Europe/Berlin";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
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
  };

  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
    printing.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    openssh = {
      enable = true;
      startWhenNeeded = true;
    };
  };

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  users.users.${username} = {
    extraGroups = lib.mkAfter ["networkmanager"];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOV9XJ1F4/1lOgEZnmcaRLzSLYnRu1CbmUCj3P9GJbjd florianbress@gmail.com"
    ];
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.05";

  nix.settings.experimental-features = ["nix-command" "flakes"];
}
