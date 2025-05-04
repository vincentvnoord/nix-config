{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = true; # set to true only if using the open kernel modules (less stable)
    nvidiaSettings = true;
  };

  hardware.graphics = {
    enable = true;
  };
}
