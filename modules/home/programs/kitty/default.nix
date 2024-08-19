{ pkgs, ... }:

{
    programs.kitty = {
        enable = true;
        theme = "Catppuccin-Mocha";
        font = {
            package = pkgs.jetbrains-mono;
            name = "JetBrainsMono Nerd Font";
            size = 14.0;
        };
        settings = {
          bold_font = "auto";
          italic_font = "auto";
          bold_italic_font = "auto";
          window_padding_width = 10;
        };
        shellIntegration.enableZshIntegration = true;
    };
}
