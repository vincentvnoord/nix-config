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

  system.stateVersion = stateVersion;
}