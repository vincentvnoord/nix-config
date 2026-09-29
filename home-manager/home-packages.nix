{ pkgs, inputs, pkgs-unstable, ... }:
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
    btop
    quickemu

    # Terminal
    alacritty
    ghostty
    zsh

    grim
    slurp
    parted

    # CLI tools
    stow
    git
    fastfetch
    ripgrep
    tmuxifier
    gcc
    postgresql
    yazi
    lazygit
    cloc
    starship
    lsof
    sqlc
    claude-code
    eas-cli
    ngrok
    brightnessctl
    bun

    # Programming tools
    nixfmt
    neovim
    php82
    php82Packages.composer
    docker
    glibc
    pkgs-unstable.code-cursor
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
    eslint

    # GUI Tools
    drawio
    dbeaver-bin
    obsidian
    darktable
    gparted
    obs-studio
    vlc
    libreoffice
    android-studio
    android-tools
    jdk17

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

    gphoto2 
    ffmpeg 

    wayland
    waybar
    quickshell
    (ags.override {
      extraPackages = [
        astal.hyprland
        astal.tray
        astal.wireplumber
      ];
    })
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
    hyprlock
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
