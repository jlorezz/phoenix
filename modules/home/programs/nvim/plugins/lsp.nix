{
  programs.nixvim = {
    plugins = {
      lsp-format.enable = true;

      lsp = {
        enable = true;

        keymaps = {
          silent = true;
          diagnostic = {
            # Navigate in diagnostics
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };

          lspBuf = {
            gd = "definition";
            gD = "references";
            gt = "type_definition";
            gi = "implementation";
            K = "hover";
            "<F2>" = "rename";
          };
        };

        servers = {
          clangd.enable = true;
          texlab.enable = true;
          tsserver.enable = true;
          tailwindcss.enable = true;
          nixd.enable = true;
          html.enable = true;
        };
      };
    };
  };
}
