{
  pkgs,
  lib,
  config,
  username,
  ...
}:
with lib; {
  config = mkIf config.virtualisation.docker.enable {
    environment.systemPackages = with pkgs; [docker-compose];
    environment.etc."containers/registries.conf".source = lib.mkForce ./registries.conf;

    users.extraGroups.docker.members = [username];
  };
}
