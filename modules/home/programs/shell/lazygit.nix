{ config, ... }: {
  programs.lazygit = {
    enable = true;
    settings = {
      gui.theme = {
        ligthTheme = false;
        activeBorderColor = [ "red" "bold" ];
        inactiveBorderColor = [ "black" ];
        selectedLineBgColor = [ "default" ];
      };
    };
  };
}
