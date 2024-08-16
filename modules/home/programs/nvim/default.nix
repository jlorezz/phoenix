{ inputs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins/cmp.nix
    ./plugins/treesitter.nix
    ./plugins/ui.nix

    ./colorscheme.nix
    ./keymaps.nix
    ./options.nix
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
