{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;

    extraConfig = ''
      set-option -a terminal-features 'alacritty:RGB'
    '';
  };
}
