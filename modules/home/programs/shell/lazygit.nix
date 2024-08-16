{ config, ... }: {
  programs.lazygit = {
    enable = true;
    settings = {
      gui.theme = {
        ligthTheme = false;
        activeBorderColor = [ "blue" "bold" ];
        inactiveBorderColor = [ "black" ];
        selectedLineBgColor = [ "default" ];
      };
    };
  };
}
