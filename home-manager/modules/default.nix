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
    # ./alacritty.nix
    (import ./waybar { inherit config pkgs hostname; })
    ./hyprpaper.nix
    (import ./zsh.nix { inherit config pkgs hostname; })
    (import ./stylix { inherit config pkgs inputs; })
    ./tmux.nix
    ./thunderbird.nix
  ];
}
