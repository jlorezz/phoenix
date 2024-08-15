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
      ../../modules/home/system/hyprland
      ../../modules/home/system/waybar
      ../../modules/home/programs/wezterm
    ];
  };

  hardware = {
    #opengl
    opengl.enable = true;

    pulseaudio.enable = false;

  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    #  Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;

    # Enable the Nvidia settings menu,
	# accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  environment.systemPackages = with pkgs; [
    discord
    emacs
    firefox-wayland
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
    neofetch
    nodejs
    networkmanagerapplet
    pipewire
    ranger
    rofi-wayland
    sddm
    waybar
    wezterm
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
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "greeter";
      };
    };
  };
  
  # Enable sound with pipewire.
  sound.enable = true;
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

  nix.settings.experimental-features = ["nix-command" "flakes"];
}

