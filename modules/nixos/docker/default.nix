{
  lib,
  config,
  username,
  ...
}:
with lib; {
  config = mkIf config.virtualisation.docker.enable {
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
