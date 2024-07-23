{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];
  boot.zfs.package = pkgs.zfs;
  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.forceImportRoot = false;    
  boot.zfs.extraPools = [ "storage" ];  

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/8061e2be-480b-4fff-a925-eb7843694ea7";
      fsType = "ext4";
    };

  swapDevices = [ ];

  networking.useDHCP = lib.mkDefault true;
  networking.hostId = "e5d98336";

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
