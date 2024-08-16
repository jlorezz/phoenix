{ inputs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./keymaps.nix
    ./options.nix
    ./plugins
    ./colorscheme.nix
  ];

  home.shellAliases.v = "nvim";

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;
  };
}
