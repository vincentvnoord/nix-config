{
  config,
  pkgs,
  stateVersion,
  hostname,
  inputs,
  user,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/modules
  ];

  networking.hostName = builtins.trace "DEBUG: Hostname is ${hostname}" hostname;

  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  services.xserver.displayManager.sddm.enable = true;

  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_470;

  system.stateVersion = stateVersion;
}
