{ config, lib, pkgs, ... }:

{
  programs.zsh.shellInit = ''
    export LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc.lib}/lib:$LD_LIBRARY_PATH"
  '';

  programs.nix-ld = {
    enable = true;

    libraries = with pkgs; [
      stdenv.cc.cc
      stdenv.cc.cc.lib
      zlib
      openssl
      curl

      glib
      nspr
      nss
      dbus
      atk
      cups
      expat
      libdrm
      libxkbcommon
      libxkbfile
      mesa
      libgbm
      vulkan-loader
      pango
      cairo
      gtk3
      alsa-lib
      pulseaudio
      libpng

      fontconfig
      freetype

      libx11
      libxcomposite
      libxdamage
      libxext
      libxfixes
      libxrandr
      libxcb
      libxi
      libxinerama
      libxcursor
      libxrender
      libxscrnsaver
      libbsd
    ];
  };
}
