{
  config,
  pkgs,
  hostname,
  inputs,
  ...
}:
{
  imports = [
    ./bash.nix
    ./alacritty.nix
    (import ./waybar { inherit config pkgs hostname; })
    (import ./hyprland { inherit config pkgs hostname; })
    (import ./zsh.nix { inherit config pkgs hostname; })
    (import ./stylix { inherit config pkgs inputs; })
  ];
}
