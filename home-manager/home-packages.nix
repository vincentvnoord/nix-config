{ pkgs, inputs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [ "dotnet-sdk-6.0.428" ];

  home.packages = with pkgs; [
    inputs.zen-browser.packages."x86_64-linux".default

    # System programs
    networkmanagerapplet
    pavucontrol
    unzip
    apacheHttpd

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
    yazi
    lazygit
    cloc
    starship

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
    gnumake

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
    libreoffice

    # Browsers
    firefox
    google-chrome
    brave

    # Go
    nodejs_24
    go_1_25
    gopls

    # .NET
    dotnet-sdk_8
    dotnet-runtime_8

    gphoto2 
    ffmpeg 

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

    # C libs
    raylib
    pkg-config
  ];
}
