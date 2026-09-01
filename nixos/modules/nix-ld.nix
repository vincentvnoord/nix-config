{ config, lib, pkgs, ... }:

{
  programs.nix-ld = {
    enable = true;

    libraries = with pkgs; [
      stdenv.cc.cc
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
