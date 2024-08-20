{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs.follows = "nixpkgs";

    devshell.url = "github:numtide/devshell";
    devshell.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?ref=refs/tags/v0.41.1&submodules=1";
    hyprland.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    # nixvim = {
    #  url = "github:nix-community/nixvim";
    #  inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = {
    flake-parts,
    ...
  } @ inputs: let
    username = "jlorezz";
    sshPubKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOV9XJ1F4/1lOgEZnmcaRLzSLYnRu1CbmUCj3P9GJbjd florianbress@gmail.com";
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      _module.args = {inherit username sshPubKey;};
      imports = [
        inputs.devshell.flakeModule
        ./modules/flake/nixosConfigurations.nix
      ];
      systems = ["x86_64-linux"];
    };
}
