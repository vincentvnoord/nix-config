{ config, pkgs, hostname, ...}: {
  imports = [
    (import ./main.nix { inherit config pkgs hostname; })
    ./hyprpaper.nix
    ./binds.nix
  ];
}