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
    ripgrep
    gcc

    # Programming tools
    nixfmt-rfc-style
    neovim
    php82
    php82Packages.composer
    docker
    glibc

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

    # Browsers
    firefox
    google-chrome
    brave

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
    nodejs_22
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
