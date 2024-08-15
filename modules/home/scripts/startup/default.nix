# File runned at startup by Hyprland
{ pkgs, config, ... }:
let
  startup = pkgs.writeShellScriptBin "startup" ''
    systemctl --user start sops-nix

    battery-watch &
    ${pkgs.waybar}/bin/waybar &


    wlr-randr --output "Unknown-1" --off # FIX: REMOVE WEIRD GHOST MONITOR
  '';

in { home.packages = [ startup ]; }
