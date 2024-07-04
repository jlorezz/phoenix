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
    environment.etc."containers/registries.conf".source = lib.mkForce ./registries.conf;

    virtualisation.podman = {
      dockerCompat = true;
      dockerSocket.enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };

    users.extraGroups.podman.members = [username];
  };
}
