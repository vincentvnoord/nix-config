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

    grim
    slurp

    # CLI tools
    git
    neofetch
    ripgrep
    gcc
    tmuxifier
    postgresql

    # Programming tools
    nixfmt-rfc-style
    neovim
    php82
    php82Packages.composer
    docker
    glibc
    code-cursor
    air
    dbmate
    direnv

    # LSP's
    lua-language-server
    typescript-language-server
    intelephense
    vscode-langservers-extracted
    emmet-ls
    tailwindcss-language-server

    # Linters
    stylua
    prettierd
    nodePackages.eslint

    # GUI Tools
    drawio
    dbeaver-bin
    obsidian
    darktable
    gparted

    # Browsers
    firefox
    google-chrome
    brave

    # Runtimes
    nodejs_24
    go
    gopls

    wayland
    waybar
    xwayland
    swaybg
    hyprland
    dconf
    polkit
    kitty
    home-manager
    vscode.fhs
    wl-clipboard
    hyprpaper
    pamixer
    spotify
    discord
    steam-run
    playerctl
    flameshot
    wofi
    postman
  ];
}
