{ config, lib, pkgs, ... }:

{
  programs.nix-ld = {
    enable = true;             # turn it on
    libraries = with pkgs; [   # list of extra dynamic libs to expose
      stdenv.cc.cc
      zlib
      openssl
      curl
      # etc.
    ];
  };
}
