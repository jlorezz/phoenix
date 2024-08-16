{
  programs.nixvim = {
    globals = {
      # Disable useless providers
      loaded_ruby_provider = 0;  # Ruby
      loaded_perl_provider = 0;  # Perl
      loaded_python_provider = 0;  # Python 2
    };

    clipboard = {
      # Use system clipboard
      register = "unnamedplus";

      providers.wl-copy.enable = true;
    };

    opts = {
      hlsearch = true;  # Set highlight on search

      # Line numbers
      number = true;  # Make line numbers default
      relativenumber = true;  # Relative line numbers

      mouse = "";  # Disable mouse mode

      breakindent = true;  # Enable break indent

      undofile = true;  # Save undo history

      ignorecase = true;  # Case insensitive searching
      smartcase = true;  # Case insensitive unless /C or capital in search

      updatetime = 250;  # Decrease update time
      signcolumn = "yes";  # Show sign column
      
      completeopt = "menuone,noselect";  # Set completeopt to have a better completion experience

      conceallevel = 2;  # Concealer for Neorg

      # Tab options (if needed)
      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      autoindent = true;

      # Additional options
      spell = false;  # Disable spell check by default
      wrap = false;  # Prevent text wrapping
      termguicolors = true;  # Enable true color support
    };
  };
}

