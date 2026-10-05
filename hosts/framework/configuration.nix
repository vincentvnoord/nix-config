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
    inputs.nixos-hardware.nixosModules.framework-amd-ai-300-series
  ];

  networking.hostName = hostname;

  # AMD graphics (no nvidia module imported for this host)
  hardware.graphics.enable = true;

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;

  system.stateVersion = stateVersion;
}
