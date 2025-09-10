{ config, pkgs, ... }:
{
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [
    3000 # Next dev server
  ];
}
