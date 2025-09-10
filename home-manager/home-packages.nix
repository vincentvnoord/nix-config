{ pkgs, inputs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    inputs.zen-browser.packages."x86_64-linux".default

    # System programs
    networkmanagerapplet
    pavucontrol
    unzip

    # Terminal
    alacritty
    zsh

    grim
    slurp

    # CLI tools
    git
    neofetch
    ripgrep
    tmuxifier
    gcc
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
    eas-cli

    # LSP's
    lua-language-server
    typescript-language-server
    intelephense
    vscode-langservers-extracted
    emmet-ls
    tailwindcss-language-server
    csharp-ls
    clang-tools

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
    obs-studio
    vlc

    # Browsers
    firefox
    google-chrome
    brave

    # Runtimes
    nodejs_24
    go
    gopls
    dotnet-sdk_9
    dotnet-runtime_9

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
