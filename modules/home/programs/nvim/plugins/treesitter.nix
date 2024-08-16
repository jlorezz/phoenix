{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;

      nixvimInjections = true;

      settings = {
        ensure_installed = [ 
          "rust" 
          "typescript" 
          "regex" 
          "bash" 
          "markdown" 
          "markdown_inline" 
          "sql" 
          "org"
          "html"
          "css"
          "javascript" 
          "json" 
          "toml"
        ]; 
        highlight.enable = true;
        indent.enable = true;
        incremental_selection = {
          enable = true;
          keymaps = {
            init_selection = "<c-space>";
            node_incremental = "<c-space>";
            scope_incremental = "<c-s>";
            node_decremental = "<c-backspace>";
          };
        };
      };
      folding = true;
    };

    treesitter-textobject = {
      select = {
        enable = true;
        lookahead = true;
        keymaps = {
          # You can use the capture groups defined in textobjects.scm
          "aa" = "@parameter.outer";
          "ia" = "@parameter.inner";
          "af" = "@function.outer";
          "if" = "@function.inner";
          "ac" = "@class.outer";
          "ic" = "@class.inner";
          "ii" = "@conditional.inner";
          "ai" = "@conditional.outer";
          "il" = "@loop.inner";
          "al" = "@loop.outer";
          "at" = "@comment.outer";
        };
      };
      move = {
        enable = true;
        setJumps = true;
        gotoNextStart = {
          "f" = "@function.outer";
          "" = "@class.outer";
        };
        gotoNextEnd = {
          "F" = "@function.outer";
          "" = "@class.outer";
        };
        gotoPreviousStart = {
          "f" = "@function.outer";
          "" = "@class.outer";
        };
        gotoPreviousEnd = {
          "F" = "@function.outer";
          "" = "@class.outer";
        };
      };
      swap = {
        enable = true;
        swapNext = {
          "<leader>a" = "@parameter.inner";
        };
        swapPrevious = {
          "<leader>A" = "@parameter.inner";
        };
      };
    };

    hmts.enable = true;
  };
}
