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
    ../../nixos/modules/nvidia.nix
  ];

  networking.hostName = builtins.trace "DEBUG: Hostname is ${hostname}" hostname;

  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_470;

  system.stateVersion = stateVersion;
}
