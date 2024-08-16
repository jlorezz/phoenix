{ pkgs, lib, config, ... }: {

  home.packages = with pkgs; [ 
    bat 
    ripgrep 
    tldr 
    starship
    kubectl 
    awscli2 
    zsh-autosuggestions 
    fd 
    fzf 
    nmap 
    cmatrix 
    neovim 
    tmux 
    eza 
    ranger 
    zoxide 
    gobuster 
    python3 
    gobuster 
    ngrok 
    ffuf
    git 
  ];

  home.sessionPath = [ "$HOME/go/bin" ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;

    initExtraFirst = ''
      bindkey -e
      bindkey '^w' autosuggest-execute
      bindkey '^e' autosuggest-accept
      bindkey '^u' autosuggest-toggle
      bindkey '^L' vi-forward-word
      bindkey '^k' up-line-or-search
      bindkey '^j' down-line-or-search
      bindkey jj vi-cmd-mode
    '';

    history = {
      ignoreDups = true;
      save = 1000000;
      size = 1000000;
    };

    profileExtra = lib.optionalString (config.home.sessionPath != [ ]) ''
      export PATH="$PATH''${PATH:+:}${
        lib.concatStringsSep ":" config.home.sessionPath
      }"
    '';

    shellAliases = {
      la = "eza --tree --level=2 --long --icons --git";
      l = "eza -l --icons --git -a";
      cat = "bat";
      cl = "clear";
      mat = "osascript -e \"tell application \\\"System Events\\\" to key code 126 using {command down}\" && tmux neww \"cmatrix\"";

      # Git aliases
      gc = "git commit -m";
      gca = "git commit -a -m";
      gp = "git push origin HEAD";
      gpu = "git pull origin";
      gst = "git status";
      glog = "git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit";
      gdiff = "git diff";
      gco = "git checkout";
      gb = "git branch";
      gba = "git branch -a";
      gadd = "git add";
      ga = "git add -p";
      gcoall = "git checkout -- .";
      gr = "git remote";
      gre = "git reset";

      # Docker aliases
      dco = "docker compose";
      dps = "docker ps";
      dpa = "docker ps -a";
      dl = "docker ps -l -q";
      dx = "docker exec -it";

      # Directory navigation aliases
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";
      "......" = "cd ../../../../..";

      # HTTP requests alias
      http = "xh";

      # Security aliases
      gobust = "gobuster dir --wordlist ~/security/wordlists/diccnoext.txt --wildcard --url";
      dirsearch = "python dirsearch.py -w db/dicc.txt -b -u";
      massdns = "~/hacking/tools/massdns/bin/massdns -r ~/hacking/tools/massdns/lists/resolvers.txt -t A -o S bf-targets.txt -w livehosts.txt -s 4000";
      server = "python -m http.server 4445";
      tunnel = "ngrok http 4445";
      fuzz = "ffuf -w ~/hacking/SecLists/content_discovery_all.txt -mc all -u";

      # Vim alias
      vim = "nvim";
      vi = "nvim";
      v = "nvim";

      # File navigation functions
      rr = "ranger";
      cx = "cd \"$@\" && l";
      fcd = "cd \"$(find . -type d -not -path '*/.*' | fzf)\" && l";
      f = "echo \"$(find . -type f -not -path '*/.*' | fzf)\" | pbcopy";
      fv = "nvim \"$(find . -type f -not -path '*/.*' | fzf)\"";
    };
  };
}
