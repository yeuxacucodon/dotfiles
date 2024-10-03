{ config, pkgs, ... }:
{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau-va-gl
      nvidia-vaapi-driver
    ];
    extraPackages32 = [ pkgs.vaapiVdpau ];
  };

  environment.systemPackages = with pkgs; [
    libva-utils
    nvidia-vaapi-driver
    pciutils
    vdpauinfo
  ];

  boot.kernelModules =
    [
    ];

  boot.kernelParams =
    [
    ];

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.latest;
    modesetting.enable = true;
    open = false;
    nvidiaSettings = false;
    prime = {
      sync.enable = true;
      amdgpuBusId = "PCI:5:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
