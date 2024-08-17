{ inputs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins/cmp.nix
    ./plugins/comment.nix
    ./plugins/floaterm.nix
    ./plugins/harpoon.nix
    ./plugins/lazy.nix
    ./plugins/lsp.nix
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

    plugins = {
      gitsigns = {
        enable = true;
        settings.signs = {
          add.text = "+";
          change.text = "~";
        };
      };

      nvim-autopairs.enable = true;

      nvim-colorizer = {
        enable = true;
        userDefaultOptions.names = false;
      };

      oil.enable = true;

      trim = {
        enable = true;
        settings = {
          highlight = true;
          ft_blocklist = [
            "checkhealth"
            "floaterm"
            "lspinfo"
            "neo-tree"
            "TelescopePrompt"
          ];
        };
      };
    };
  };
}
