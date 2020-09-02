{ config, lib, pkgs, ... }:

{
  hardware.bumblebee.enable = true;
  hardware.bumblebee.connectDisplay = true;
  hardware.bumblebee.driver = "nvidia";
  hardware.bumblebee.pmMethod = "auto";

  nixpkgs.overlays = [
    (self: super: {
      bumblebee = super.bumblebee.override {
        extraNvidiaDeviceOptions = ''
          Option "ProbeAllGpus" "false"
          Option "AllowEmptyInitialConfiguration"
        '';
      };
    })
  ];

#         EndSection
#        Section "Screen"
#          Identifier "Default Screen"
#          Device "DiscreteNvidia"

  services.xserver.deviceSection = ''
    Option "VirtualHeads" "1"
    BusID "PCI:0:2:0"
    Option "NoAccel" "True"
    Option "DRI" "False"
    Option "TearFree" "true"
  '';
}
