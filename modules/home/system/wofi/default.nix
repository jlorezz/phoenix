{ ... }: {

  programs.wofi = {
    enable = true;

    settings = {
      allow_markup = true;
      width = 450;
      show = "drun";
      prompt = "Apps";
      normal_window = true;
      layer = "top";
      term = "foot";
      height = "305px";
      orientation = "vertical";
      halign = "fill";
      line_wrap = "off";
      dynamic_lines = false;
      allow_images = true;
      image_size = 24;
      exec_search = false;
      hide_search = false;
      parse_search = false;
      insensitive = true;
      hide_scroll = true;
      no_actions = true;
      sort_order = "default";
      gtk_dark = true;
      filter_rate = 100;
      key_expand = "Tab";
      key_exit = "Escape";
    };

    style = ''
      /** ********** Fonts ********** **/

      * {
        font-family: "SFProDisplay Nerd Font";
        font-weight: 500;
        font-size: 13px;
      }

      #window {
        background-color: #bac2de
        color: #bac2de;
        border-radius: 11px;
      }

      #outer-box {
        padding: 20px;
      }

      #input {
        background-color: #01010b;
        border: 0px solid #89b4fa;
        padding: 8px 12px;
      }

      #scroll {
        margin-top: 20px;
      }

      #inner-box {}

      #img {
        padding-right: 8px;
      }

      #text {
        color: #cdd6f4;
      }

      #text:selected {
        color: #cdd6f4;
      }

      #entry {
        padding: 6px;
      }

      #entry:selected {
        background-color: #89b4fa;
        color: #1e1e2e;
      }

      #unselected {}

      #selected {}

      #input,
      #entry:selected {
        border-radius: 11px;
      }
    '';
  };
}
