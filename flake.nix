{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixos-wsl.url = "github:nix-community/NixOS-WSL";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vscode-server.url = "github:nix-community/nixos-vscode-server";
    flake-parts.url = "github:hercules-ci/flake-parts";
    devshell.url = "github:numtide/devshell";
  };

  outputs = {
    self,
    flake-parts,
    ...
  } @ inputs: let
    username = "jlorezz";
    sshPubKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOV9XJ1F4/1lOgEZnmcaRLzSLYnRu1CbmUCj3P9GJbjd florianbress@gmail.com";
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        inputs.devshell.flakeModule
        (import ./modules/flake/nixosConfigurations.nix {inherit inputs username sshPubKey;})
      ];
      systems = ["x86_64-linux"];
      perSystem = {pkgs, ...}: {
        devshells.default.packages = with pkgs; [nil alejandra];
        devshells.node.packages = with pkgs; [nodejs nodePackages.pnpm];
        devshells.bun.packages = with pkgs; [bun];
        devshells.cpp.packages = with pkgs; [clang-tools cmake cppcheck vcpkg gtest];
      };
    };
}
