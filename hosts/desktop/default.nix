{ config, lib, pkgs, inputs, username, ... }:

{
  imports = [ ./hardware.nix ];

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
      ../../modules/home/programs/kitty

      # scripts
      ../../modules/home/scripts
    ];
  };

  hardware.opengl.enable = true;

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  environment.systemPackages = with pkgs; [
    lutris
    vulkan-loader
    vulkan-tools
    wine
    steam
    winetricks
    vesktop
    emacs
    firefox-wayland
    greetd.tuigreet
    fzf
    git
    gcc
    cmake
    cmatrix
    python3
    gnome.gnome-keyring
    hyprpaper
    vscode
    kitty
    gnumake
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
    libdecor
    wl-clipboard
    xdg-utils
  ];

  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    nerdfonts
    font-awesome
  ];

  programs.gamemode.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --asterisks --container-padding 2 --time --time-format '%I:%M %p | %a • %h | %F' --cmd Hyprland";
        user = "greeter";
      };
    };
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services.flatpak.enable = true;

  # Ensure xwayland is available even on wayland session
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];


  environment.variables = {
    XDG_SESSION_TYPE = "wayland";
    WLR_NO_HARDWARE_CURSORS = "1";
    MOZ_ENABLE_WAYLAND = "1";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    GAMEMODE_AUTO = "1";
    NIXOS_OZONE_WL = "1";
  };

  services.openssh.enable = true;

  system.stateVersion = "24.05";

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];
}
