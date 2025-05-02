{ config, pkgs, hostname, ... }: {
  imports = [
    ./waybar
    ./hyprland
    ./bash.nix
    (import ./zsh.nix { inherit config pkgs hostname; })
  ];
}
