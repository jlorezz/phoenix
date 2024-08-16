{
  programs.nixvim.plugins.telescope = {
    enable = true;

    enabledExtensions = [
      "git_worktree"
    ];

    settings = {
      defaults = {
        layout_strategy = "horizontal";
        layout_config = {
          preview_width = 0.65;
          horizontal = {
            size = {
              width = "95%";
              height = "95%";
            };
          };
        };
        pickers = {
          find_files = {
            theme = "dropdown";
          };
        };
        mappings = {
          i = {
            ["<C-u>"] = false;
            ["<C-d>"] = false;
            ["<C-j>"] = {
              __raw = "require('telescope.actions').move_selection_next";
            };
            ["<C-k>"] = {
              __raw = "require('telescope.actions').move_selection_previous";
            };
            ["<C-d>"] = {
              __raw = "require('telescope.actions').move_selection_previous";
            };
          };
        };
      };
    };

  keymaps = {
    normalMode = {
      ["<leader>?"] = {
        action = "builtin.oldfiles";
        options = { desc = "[?] Find recently opened files"; };
      };
      ["<leader>/"] = {
        __raw = "function() require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10, previewer = true }) end";
        options = { desc = "[/] Fuzzily search in current buffer]"; };
      };
      ["<leader>sf"] = {
        action = "builtin.find_files";
        options = { desc = "[S]earch [F]iles"; };
      };
      ["<leader>sw"] = {
        action = "builtin.grep_string";
        options = { desc = "[S]earch current [W]ord"; };
      };
      ["<leader>sg"] = {
        action = "builtin.live_grep";
        options = { desc = "[S]earch by [G]rep"; };
      };
      ["<leader>sd"] = {
        action = "builtin.diagnostics";
        options = { desc = "[S]earch [D]iagnostics"; };
      };
      ["<leader>sb"] = {
        action = "builtin.buffers";
        options = { desc = "[ ] Find existing buffers"; };
      };
      ["<leader>sS"] = {
        action = "builtin.git_status";
        options = { desc = ""; };
      };
      ["<leader>sm"] = {
        __raw = ":Telescope harpoon marks<CR>";
        options = { desc = "Harpoon [M]arks"; };
      };
      ["<Leader>sr"] = {
        __raw = "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>";
        options = { silent = true; };
      };
      ["<Leader>sR"] = {
        __raw = "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>";
        options = { silent = true; };
      };
      ["<Leader>sn"] = {
        __raw = "<CMD>lua require('telescope').extensions.notify.notify()<CR>";
        options = { silent = true; };
      };
      ["st"] = {
        __raw = ":TodoTelescope<CR>";
        options = { noremap = true; };
      };
      ["<Leader><tab>"] = {
        __raw = "<Cmd>lua require('telescope.builtin').commands()<CR>";
        options = { noremap = false; };
      };
    };
  };
}
