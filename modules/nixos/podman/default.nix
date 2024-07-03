{
  pkgs,
  lib,
  config,
  username,
  ...
}:
with lib; {
  config = mkIf config.virtualisation.podman.enable {
    environment.systemPackages = with pkgs; [dive podman-tui];

    virtualisation.podman = {
      dockerCompat = true;
      dockerSocket.enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };

    users.extraGroups.podman.members = [username];
  };
}
