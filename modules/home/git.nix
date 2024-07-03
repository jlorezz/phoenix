{
  pkgs,
  lib,
  username,
  ...
}: {
  home.packages = with pkgs; [lazygit];

  programs.git = {
    enable = true;
    userName = lib.mkDefault username;
    userEmail = lib.mkDefault "florianbress@gmail.com";
    ignores = [".direnv/"];
    extraConfig = lib.mkDefault {
      # Does not allow merging. If just one property is replaced, the entire `extraConfig` disappears.
      pull.rebase = true;
      commit.gpgsign = true;
      gpg.format = "ssh";
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
      user.signingkey = "~/.ssh/id_ed25519.pub";
    };
  };
}
