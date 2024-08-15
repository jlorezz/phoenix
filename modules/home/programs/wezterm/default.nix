{ inputs, config, pkgs, ... }:

{
  programs.wezterm = {
    enable = true;
    package = inputs.wezterm.packages.${pkgs.system}.default;
    config = {
      color_scheme = "Catppuccin Mocha";
      font_size = 16.0;
      font = {
        family = "JetBrains Mono";
        size = 16.0;
      };
      enable_tab_bar = false;
      enable_wayland = true;

      keys = [
        {
          key = "\\";
          mods = "CTRL";
          action = "ClearScrollbackAndViewport";
        }
      ];

      mouse_bindings = [
        {
          event = { Up = { streak = 1, button = "Left" } };
          mods = "CTRL";
          action = "OpenLinkAtMouseCursor";
        }
      ];
    };
  };
}
