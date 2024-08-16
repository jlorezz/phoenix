{ config, ... }: {
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    colors = {
      "fg+" = "blue";
      "bg+" = "-1";
      "fg" = "white";
      "bg" = "-1";
      "prompt" = "grey";
      "pointer" = "blue";
    };
    defaultOptions = [
      "--margin=1"
      "--layout=reverse"
      "--border=rounded"
      "--info='hidden'"
      "--header=''"
      "--prompt='/ '"
      "-i"
      "--no-bold"
    ];
  };
}
