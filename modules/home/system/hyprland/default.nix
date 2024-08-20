{ pkgs, config, inputs, ... }:

{
  # Import additional configurations if needed
  imports = [
    ./hyprlocktty.nix
    ./hypridle.nix
    ./hyprpaper.nix
  ];


  # Define packages for the home environment
  home.packages = with pkgs; [
    hyprshot
    hyprpicker
    xdg-desktop-portal-hyprland
    wlr-randr
    wl-clipboard
    brightnessctl
    gnome-themes-extra
    wlsunset
    xwayland
    xdg-desktop-portal-gtk
    wlroots
    qt5ct
    libva
    dconf
    wayland-utils
    wayland-protocols
    meson
  ];

  # Hyprland window manager configuration
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;

    extraConfig = builtins.readFile ./hyprland.conf;
  };
}
