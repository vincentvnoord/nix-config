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
  services.displayManager.sddm.enable = true;

  system.stateVersion = stateVersion;
}
