{ config, pkgs, ... }: {
  virtualisation.docker.enable = true;
  environment.systemPackages = with pkgs; [ docker ];
  users.users.vincent.extraGroups = [ "docker" ];
}
