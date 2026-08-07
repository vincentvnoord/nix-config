{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;

    extraConfig = ''
      set -g default-terminal "tmux-256color"
      set -ga terminal-overrides ",*:Tc"
      set -g pane-border-style fg=colourNONE,bg=default
      set -g pane-active-border-style fg=colourNONE,bg=default
    '';
  };
}
