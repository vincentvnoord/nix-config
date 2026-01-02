{ config, pkgs, ... }:
{
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [
    3000 # Next dev server
  ];
  networking.hosts = {
    "web.localhost" = ["127.0.0.1"];
    "api.localhost" = ["127.0.0.1"];
  };
}
