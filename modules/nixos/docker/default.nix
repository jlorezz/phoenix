{
  lib,
  config,
  username,
  ...
}:
with lib; {
  config = mkIf config.virtualisation.docker.enable {
    environment.systemPackages = with pkgs; [docker-compose];
    environment.etc."containers/registries.conf".source = lib.mkForce ./registries.conf;

    virtualisation.docker = {
      storageDriver = "zfs";
      daemon.settings = {
        data-root = "/storage/docker-dataset";
      };
    };

    users.extraGroups.docker.members = [username];
  };
}
