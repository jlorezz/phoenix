{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraLuaConfig = ''
      ${builtins.readFile ../../config/nvim/init.lua}
    '';
  };
}

