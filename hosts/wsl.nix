{
  inputs,
  username,
  ...
}: {
  imports = [
    inputs.nixos-wsl.nixosModules.wsl
    ../modules/nixos/podman
  ];

  home-manager.users.${username} = {
    imports = [../modules/home/git.nix];

    enableNodeJs = true;
    enableNodeJsPkgs = true;
    enableGolang = true;
    enableElixir = true;
  };

  virtualisation.podman.enable = true;

  programs.fish.interactiveShellInit = ''
    set fish_greeting
    bind -k nul -M insert 'accept-autosuggestion'
    set -Ux GIT_ASKPASS ""
    ssh-add ~/.ssh/id_ed25519
  '';

  networking = {
    hostName = "wsl";
  };

  wsl = {
    enable = true;
    wslConf.automount.root = "/mnt";
    wslConf.user.default = username;
    defaultUser = username;
    startMenuLaunchers = true;
    nativeSystemd = true;
    interop.register = true;
    useWindowsDriver = true;
  };

  fileSystems."/home/${username}/.ssh" = {
    device = "C:\\Users\\Florian\\.ssh";
    fsType = "drvfs";
    options = ["rw" "noatime" "uid=1000" "gid=100" "case=off" "umask=0077" "fmask=0177"];
  };
}
