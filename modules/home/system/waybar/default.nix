{ config, ... }: {
  services = {
    blueman-applet.enable = true;
    network-manager-applet.enable = true;
  };

  programs.waybar = {
    enable = true;
    # package = inputs.waybar.packages."${pkgs.system}".waybar;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = 0;
        "margin-top" = 0;  
        "margin-left" = 0;
        "margin-right" = 0;
        "margin-bottom" = 0;
        height = 16;
        modules-left = [ "custom/logo" "hyprland/window" ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [
          "tray"
          "backlight"
          "pulseaudio"
          "custom/caffeine"
          "custom/night-shift"
          "battery"
          "clock"
          "custom/power"
        ];

        "wlr/taskbar" = {
          format = "{icon}";
          "on-click" = "activate";
          "on-click-right" = "fullscreen";

          "icon-size" = 25;
          "tooltip-format" = "{title}";
        };
        "hyprland/window" = {
          "format" = "{title:30}";
          "max-length" = 30;
          "separate-outputs" = true;
        };

        "hyprland/workspaces" = {
          "on-click" = "activate";
          format = "{icon}";
          "format-icons" = {
            "default" = "";
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "active" = "󱓻";
            "urgent" = "󱓻";
          };
          "persistent-workspaces" = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
            "5" = [ ];
          };
        };

        tray = { spacing = 16; };

        clock = {
          "tooltip-format" = "<tt>{calendar}</tt>";
          "format-alt" = "  {:%a, %d %b %Y}";
          format = "󰥔  {:%I:%M %p}";
        };

        pulseaudio = {
          format = "{icon}";
          "format-bluetooth" = "󰂰";
          nospacing = 1;
          "tooltip-format" = "Volume : {volume}%";
          "format-muted" = "󰝟";
          "format-icons" = {
            "headphone" = "";
            "default" = [ "󰖀" "󰕾" "" ];
          };
          "on-click" = "sound-toggle";
          "scroll-step" = 1;
        };

        "custom/logo" = {
          format = "  ";
          tooltip = false;
          on-click = "menu";
        };

        battery = {
          format = "{capacity}% {icon}";
          "format-icons" = {
            "charging" = [ "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅" ];
            "default" = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
          };
          "format-full" = "󰁹 ";
          interval = 10;
          states = {
            warning = 20;
            critical = 10;
          };
          tooltip = false;
        };

        "custom/power" = {
          format = "󰤆";
          tooltip = false;
          on-click = "powermenu";
        };
        "custom/caffeine" = {
          format = "{}";
          max-length = 5;
          interval = 10;
          exec = "caffeine-status-icon";
          "on-click" = "caffeine";
          # exec-if = "pgrep spotify";
          # return-type = "";
        };
        "custom/night-shift" = {
          format = "{}";
          max-length = 5;
          interval = 10;
          exec = "night-shift-status-icon";
          "on-click" = "night-shift";
        };
        backlight = {
          device = "nvidia_0";
          format = "{icon}";
          "format-icons" = [ " " " " "" "" "" "" "" "" "" ];
        };
      };
    };
    style = ''
      * {
        border: none;
        border-radius: 0;
        min-height: 0;
        font-family: "SFProDisplay Nerd Font";
        color: #cdd6f4;
        font-weight: 700;
      }

      window#waybar {
        background-color: rgba(0, 0, 0, 0);
        transition-property: background-color;
        transition-duration: 0.5s;
        border-radius: 11px;
        font-size: 15px;
      }

      .modules-left, .modules-center, .modules-right {
        border-radius: 11px;
        background-color: #01010b;
        padding: 2px 6px;
      }

      window#waybar.hidden {
        opacity: 0.5;
      }

      #workspaces {
        background-color: transparent;
      }

      #workspaces button {
        all: initial; /* Remove GTK theme values (waybar #1351) */
        min-width: 0; /* Fix weird spacing in materia (waybar #450) */
        box-shadow: inset 0 -3px transparent; /* Use box-shadow instead of border so the text isn't offset */
        padding: 6px 18px;
        margin: 6px 3px;
        border-radius: 4px;
        background-color: #181825;
        color: #bac2de;
      }

      #workspaces button.active {
        color: #1e1e2e;
        background-color: #89b4fa;
      }

      #workspaces button:hover {
       box-shadow: inherit;
       text-shadow: inherit;
       opacity: 0.8;
      }

      #workspaces button.urgent {
        background-color: #f38ba8;
      }

      #window > * {
        font-family: "FiraCode Nerd Font Mono";
      }

      #memory,
      #custom-power,
      #custom-caffeine,
      #custom-night-shift,
      #battery,
      #backlight,
      #pulseaudio,
      #network,
      #clock,
      #tray,
      #backlight{
        border-radius: 9px;
        margin: 6px 3px;
        padding: 6px 12px;
        background-color: #181825;
        color: #bac2de;
      }

      #tray menu {
        background-color: #181825;
        color: #bac2de;
      }

      #custom-logo {
        padding-right: 7px;
        font-size: 15px;
        color: #89b4fa;
      }

      @keyframes blink {
        to {
          background-color: #f38ba8;
          color: #181825;
        }
      }

      #battery.warning,
      #battery.critical,
      #battery.urgent {
        background-color: #ff0048;
        color: #181825;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      #battery.charging {
        background-color: #181825;
        color: #bac2de;
        animation: none;
      }

      #custom-power {
        background-color: #89b4fa;
        color: #1e1e2e;
      }


      tooltip {
        border-radius: 8px;
        padding: 15px;
        background-color: #181825;
        color: #bac2de;
      }

      tooltip label {
        padding: 5px;
        background-color: #181825;
        color: #bac2de;
      }
    '';
  };
}
