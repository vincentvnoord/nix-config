{ config, pkgs, lib, ... }:

{
  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModulePackages = [ pkgs.linuxPackages.v4l2loopback ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=0 card_label="My Virtual Camera" exclusive_caps=1
  '';
  environment.systemPackages = with pkgs; [
    v4l-utils # Optional: For managing the virtual device
  ];
  # Ensure your boot kernel is compatible, e.g. boot.kernelPackages = pkgs.linux_latest;
}
