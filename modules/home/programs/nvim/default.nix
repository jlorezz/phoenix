{ inputs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins/cmp.nix
    ./plugins/comment.nix
    ./plugins/floaterm.nix
    ./plugins/harpoon.nix
    ./plugins/lazy.nix
    ./plugins/neo-tree.nix
    ./plugins/tele.nix
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
