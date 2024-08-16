{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;

      nixvimInjections = true;

      incrementalSelection = {
        enable = true;
        keymaps = {
          initSelection = "<c-space>";
          nodeIncremental = "<c-space>";
          scopeIncremental = "<c-s>";
          nodeDecremental = "<c-backspace>";
        };
      };
    };

    treesitter-textobjects = {
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
