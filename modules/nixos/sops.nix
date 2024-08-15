{
  config,
  inputs,
  username,
  ...
}: {
  imports = [inputs.sops-nix.nixosModules.sops];
  sops = {
    defaultSopsFile = ../../secrets/default.yaml;
    age.keyFile = "/home/${username}/.config/sops/age/keys.txt";
    secrets = {
      user_password.neededForUsers = true;
    };
  };
}
