{
  config,
  lib,
  ...
}: {
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    keymaps = [
      {
        key = "<Space>";
        action = "<NOP>";
        options.desc = "Unmap Space key";
      }
      {
        key = "<esc>";
        action = ":noh<CR>";
        options.desc = "Clear search results";
      }
      {
        key = "Y";
        action = "y$";
        options.desc = "Fix Y behavior";
      }
      {
        key = "<C-c>";
        action = ":b#<CR>";
        options.desc = "Toggle between the two most recent files";
      }
      {
        key = "<C-x>";
        action = ":close<CR>";
        options.desc = "Close window";
      }
      {
        key = "<leader>s";
        action = ":w<CR>";
        options.desc = "Save file";
      }
      {
        key = "<C-s>";
        action = ":w<CR>";
        options.desc = "Save file (Ctrl+S)";
      }
      {
        key = "<leader>h";
        action = "<C-w>h";
        options.desc = "Navigate to the left window";
      }
      {
        key = "<leader>l";
        action = "<C-w>l";
        options.desc = "Navigate to the right window";
      }
      {
        key = "L";
        action = "$";
        options.desc = "Jump to the end of the line";
      }
      {
        key = "H";
        action = "^";
        options.desc = "Jump to the start of the line";
      }
      {
        key = "<C-Up>";
        action = ":resize -2<CR>";
        options.desc = "Resize window upwards";
      }
      {
        key = "<C-Down>";
        action = ":resize +2<CR>";
        options.desc = "Resize window downwards";
      }
      {
        key = "<C-Left>";
        action = ":vertical resize +2<CR>";
        options.desc = "Resize window to the left";
      }
      {
        key = "<C-Right>";
        action = ":vertical resize -2<CR>";
        options.desc = "Resize window to the right";
      }
      {
        key = "<M-k>";
        action = ":move-2<CR>";
        options.desc = "Move current line up";
      }
      {
        key = "<M-j>";
        action = ":move+<CR>";
        options.desc = "Move current line down";
      }
      {
        key = "<leader>rp";
        action = ":!remi push<CR>";
        options.desc = "Remi push";
      }
      {
        key = "tw";
        action = ":Twilight<CR>";
        options.desc = "Toggle Twilight";
      }
      {
        key = "tk";
        action = ":blast<CR>";
        options.desc = "Go to the last buffer";
      }
      {
        key = "tj";
        action = ":bfirst<CR>";
        options.desc = "Go to the first buffer";
      }
      {
        key = "th";
        action = ":bprev<CR>";
        options.desc = "Go to the previous buffer";
      }
      {
        key = "tl";
        action = ":bnext<CR>";
        options.desc = "Go to the next buffer";
      }
      {
        key = "td";
        action = ":bdelete<CR>";
        options.desc = "Delete current buffer";
      }
      {
        key = "QQ";
        action = ":q!<CR>";
        options.desc = "Quit without saving";
      }
      {
        key = "WW";
        action = ":w!<CR>";
        options.desc = "Save file forcefully";
      }
      {
        key = "E";
        action = "$";
        options.desc = "Jump to the end of the line (alternative)";
      }
      {
        key = "B";
        action = "^";
        options.desc = "Jump to the start of the line (alternative)";
      }
      {
        key = "TT";
        action = ":TransparentToggle<CR>";
        options.desc = "Toggle transparency";
      }
      {
        key = "ss";
        action = ":noh<CR>";
        options.desc = "Clear search highlights";
      }
      {
        key = "<leader>nn";
        action = ":Noice dismiss<CR>";
        options.desc = "Dismiss Noice plugin notifications";
      }
      {
        key = "<leader>ee";
        action = "<cmd>GoIfErr<cr>";
        options.desc = "Invoke GoIfErr plugin";
      }
      {
        key = ">";
        action = ">gv";
        mode = "v";
        options.desc = "Indent and reselect in visual mode";
      }
      {
        key = "<";
        action = "<gv";
        mode = "v";
        options.desc = "Outdent and reselect in visual mode";
      }
      {
        key = "<TAB>";
        action = ">gv";
        mode = "v";
        options.desc ="Indent with TAB and reselect in visual mode";
      }
      {
        key = "<S-TAB>";
        action = "<gv";
        mode = "v";
        options.desc = "Outdent with Shift+TAB and reselect in visual mode";
      }
      {
        key = "K";
        action = ":m '<-2<CR>gv=gv";
        mode = "v";
        options.desc = "Move selected block up in visual mode";
      }
      {
        key = "J";
        action = ":m '>+1<CR>gv=gv";
        mode = "v";
        options.desc = "Move selected block down in visual mode";
      }
      {
        key = "jj";
        action = "<Esc>";
        mode = "i";
        options.desc = "Exit insert mode by pressing jj";
      }
    ];
  };
}

