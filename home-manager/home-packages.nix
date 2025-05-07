{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # System programs
    networkmanagerapplet
    pavucontrol

    # Terminal
    alacritty
    zsh

    # CLI tools
    git
    neofetch

    # Programming tools
    nixfmt-rfc-style
    neovim
    php82
    php82Packages.composer
    docker
    glibc

    # GUI Tools
    drawio

    wayland
    waybar
    xwayland
    swaybg
    hyprland
    dconf
    polkit
    firefox
    kitty
    dolphin
    home-manager
    vscode
    wl-clipboard
    hyprpaper
    nodejs_22
    pamixer
    spotify
    discord
    steam-run
    playerctl
    flameshot
    wofi
  ];
}
