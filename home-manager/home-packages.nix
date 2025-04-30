{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Terminal
    alacritty

    # CLI tools
    git

    # Programming tools
    nixfmt
    neovim
    php82
    php82Packages.composer
    docker


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
