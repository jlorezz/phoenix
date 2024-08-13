{config, pkgs, ... }

{
  progams.wezterm = {
   enable = true;
   extraConfig = builtins.readFile ../wezterm/wezterm.lua;
  };
}
