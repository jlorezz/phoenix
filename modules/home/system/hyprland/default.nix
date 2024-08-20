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

    settings = {
      #############################
      ### ESSENTIAL ENVIRONMENT ###
      #############################

      exec-once = [
        "startup"
        "${pkgs.hypridle}/bin/hypridle"
        "${pkgs.hyprpaper}/bin/hyprpaper"
      ];

      # Environment variables
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        "LIBVA_DRIVER_NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "GBM_BACKEND,nvidia-drm"
        "XDG_SESSION_DESKTOP,Hyprland"
      ];

      ################
      ### MONITORS ###
      ################

      # See https://wiki.hyprland.org/Configuring/Monitors/
      monitor = [
        "DP-1,2560x1440@164.84,0x0,1"
        "DP-2,2560x1440@164.84,2560x0,1"
        "HDMI-A-2,2560x1440@143.86,5120x0,1"
      ];

      ###################
      ### LOOK AND FEEL ###
      ###################

      # General appearance settings
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };

      # Decoration settings
      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      # Miscellaneous settings
      misc = {
        force_default_wallpaper = -1; # Disable the anime mascot wallpapers
        disable_hyprland_logo = false; # Show the Hyprland logo/anime background
      };

      # Animation settings
      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      ####################
      ### INPUT CONFIG ###
      ####################

      # Input settings
      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
        follow_mouse = 1;
        sensitivity = 0; # Sensitivity setting
        touchpad = {
          natural_scroll = false;
        };
      };

      # Gesture settings
      gestures = {
        workspace_swipe = false;
      };

      # Example per-device config
      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      ####################
      ### KEYBINDINGS ###
      ####################

      # Keybindings
      "$mainMod" = "SUPER"; # Main modifier key

      bind = [
        # Launch applications
        "$mainMod, C, exec, ${pkgs.kitty}/bin/kitty" # Launch terminal
        "$mainMod, E, exec, ${pkgs.xfce.thunar}/bin/thunar" # Thunar
        "$mainMod, B, exec, ${pkgs.firefox}/bin/firefox" # Firefox
        "$mainMod, K, exec, ${pkgs.bitwarden}/bin/bitwarden" # Bitwarden
        "$mainMod, L, exec, ${pkgs.hyprlock}/bin/hyprlock" # Lock
        "$mainMod, X, exec, powermenu" # Powermenu
        "$mainMod, SPACE, exec, menu" # Launcher

        "$mainMod, Q, killactive," # Close window
        "$mainMod, T, togglefloating," # Toggle Floating
        "$mainMod, F, fullscreen" # Toggle Fullscreen
        "$mainMod, left, movefocus, l" # Move focus left
        "$mainMod, right, movefocus, r" # Move focus Right
        "$mainMod, up, movefocus, u" # Move focus Up
        "$mainMod, down, movefocus, d" # Move focus Down

        # Window focus movement
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Special workspace
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Scroll through workspaces with mouse scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # Additional keybinds
        "$mainMod, S, exec, rofi -show drun -showicons"

        "$mainMod, F2, exec, night-shift-off" # Turn off night shift
        "$mainMod, F3, exec, night-shift-on" # Turn on night shift

      ];

      # Mouse bindings
      bindm = [
        "$mainMod, mouse:272, movewindow" # Move window with mouse
        "$mainMod, mouse:273, resizewindow" # Resize window with mouse
      ];

      ##########################
      ### WINDOWS AND WORKSPACES ###
      ##########################

      # Dwindle layout settings
      dwindle = {
        pseudotile = true; # Master switch for pseudotiling
        preserve_split = true; # Preserve splits when changing layouts
      };

      # Master layout settings
      master = {
        new_status = "master";
      };

      # Window rules
      windowrulev2 = [
        "suppressevent maximize, class:.*" # Suppress maximize event for all windows
      ];
    };
  };
}
