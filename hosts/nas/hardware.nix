{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    kernelModules = ["kvm-amd"];
    extraModulePackages = [];
    supportedFilesystems = ["zfs"];
    initrd = {
      availableKernelModules = ["xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod"];
      kernelModules = [];
    };
    zfs = {
      package = pkgs.zfs;
      forceImportRoot = false;
      extraPools = ["storage"];
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/8061e2be-480b-4fff-a925-eb7843694ea7";
    fsType = "ext4";
  };

  swapDevices = [];

  networking = {
    hostId = "e5d98336";
    useDHCP = lib.mkDefault true;
  };

  systemd.targets = {
    sleep.enable = false;
    suspend.enable = false;
    hibernate.enable = false;
    hybrid-sleep.enable = false;
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
