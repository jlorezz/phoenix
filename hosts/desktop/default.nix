{ config, lib, pkgs, inputs, username, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  home-manager.users.${username} = {
    imports = [
      ../../modules/home/git.nix

      # system
      ../../modules/home/system/hyprland
      ../../modules/home/system/waybar
      ../../modules/home/system/dunst
      ../../modules/home/system/wofi
      ../../modules/home/system/wlogout

      # programs
      ../../modules/home/programs/wezterm
      ../../modules/home/programs/nvim
      ../../modules/home/programs/shell
      ../../modules/home/programs/dir-env

      # scripts
      ../../modules/home/scripts
    ];
  };

  hardware = {
    opengl.enable = true;
    pulseaudio.enable = false;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  environment.systemPackages = with pkgs; [
    discord
    emacs
    firefox-wayland
    greetd.tuigreet
    fzf
    git
    gcc
    cmake
    bottles
    cmatrix
    python3
    gnome.gnome-keyring
    hyprpaper
    vscode
    kitty
    gnumake
    protonup-qt
    obs-studio
    neofetch
    nodejs
    networkmanagerapplet
    pipewire
    ranger
    rofi-wayland
    sddm
    spotify
    teams-for-linux
    waybar
    wezterm
    mangohud
    pkg-config
    wget
    xdg-utils
  ];

  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    nerdfonts
    font-awesome
  ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --asterisks --container-padding 2 --time --time-format '%I:%M %p | %a • %h | %F' --cmd Hyprland";
        user = "greeter";
      };
    };
  };

  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services = {
    gnome.gnome-keyring.enable = true;
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  system.stateVersion = "24.05";

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];
}
