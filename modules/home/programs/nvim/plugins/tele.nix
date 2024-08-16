{ config, pkgs, ... }:

{
  programs.nixvim.plugins.telescope = {
    enable = true;
    
    enabledExtensions = [
      # "git_worktree" # Load the git_worktree extension
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
            "<C-u>" = false;
            "<C-d>" = false;
            "<C-j>" = "require('telescope.actions').move_selection_next";
            "<C-k>" = "require('telescope.actions').move_selection_previous";
          };
        };
      };
    };
    keymaps = {
      "<C-p>" = {
        action = "builtin.git_files";
        options = {
          desc = "Telescope Git Files";
        };
      };
      "<leader>fg" = {
        action = "builtin.live_grep";
        options = {
          desc = "Telescope Live Grep";
        };
      };
      "<leader>?" = {
        action = "builtin.oldfiles";
        options = {
          desc = "[?] Find recently opened files";
        };
      };
      "<leader>/" = {
        action = "function() require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10, previewer = true }) end";
        options = {
          desc = "[/] Fuzzily search in current buffer]";
        };
      };
      "<leader>sf" = {
        action = "builtin.find_files";
        options = {
          desc = "[S]earch [F]iles";
        };
      };
      "<leader>sw" = {
        action = "builtin.grep_string";
        options = {
          desc = "[S]earch current [W]ord";
        };
      };
      "<leader>sg" = {
        action = "builtin.live_grep";
        options = {
          desc = "[S]earch by [G]rep";
        };
      };
      "<leader>sd" = {
        action = "builtin.diagnostics";
        options = {
          desc = "[S]earch [D]iagnostics";
        };
      };
      "<leader>sb" = {
        action = "builtin.buffers";
        options = {
          desc = "[ ] Find existing buffers";
        };
      };
      "<leader>sS" = {
        action = "builtin.git_status";
        options = {
          desc = "";
        };
      };
      "<leader>sm" = {
        action = ":Telescope harpoon marks<CR>";
        options = {
          desc = "Harpoon [M]arks";
        };
      };
      "<Leader>sr" = {
        action = "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>";
        options = {
          silent = true;
        };
      };
      "<Leader>sR" = {
        action = "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>";
        options = {
          silent = true;
        };
      };
      "<Leader>sn" = {
        action = "<CMD>lua require('telescope').extensions.notify.notify()<CR>";
        options = {
          silent = true;
        };
      };
      "st" = {
        action = ":TodoTelescope<CR>";
        options = {
          noremap = true;
        };
      };
      "<Leader><tab>" = {
        action = "<Cmd>lua require('telescope.builtin').commands()<CR>";
        options = {
          noremap = false;
        };
      };
    };
  };
}

