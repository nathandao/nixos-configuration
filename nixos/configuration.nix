# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./power-management.nix
      ./vpn/openvpn.nix
      ./desktop.nix
      ./bumblebee.nix
      # ./virtualisation/virtualisation.nix
    ];

  hardware.cpu.intel.updateMicrocode = true;
  services.fwupd.enable = true;

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport= true;
  boot.loader.grub.version = 2;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.copyKernels = false;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.gfxpayloadEfi = "keep";
  boot.loader.grub.gfxmodeEfi = "640x480";
  boot.loader.grub.splashMode = "normal";

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [
    # In case for another rom extract attempt
    # "pci_stub.ids=10de:1c8c,10de:0fb9"

    # Params to help make sure bbswith still works properly
    "nogpumanager"
    "acpi_osi=!"
    "acpi_osi=Linux"
    "acpi_osi=\"Windows 2015\""
    "pcie_port_pm=off"

    # Enabled Intel gvt
    "i915.enable_gvt=Y"
  ];

  boot.blacklistedKernelModules = ["nvidia" "nouveau" "nvidiafb"];

  virtualisation.docker.enable = true;
  virtualisation.docker.enableOnBoot = false;
  virtualisation.docker.autoPrune.enable = true;

  networking.hostName = "FL572"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.useDHCP = false;
  networking.interfaces.wlp0s20f3.useDHCP = true;

  console.useXkbConfig = true;
  time.timeZone = "Europe/Helsinki";

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    cpufrequtils
    curl
    direnv
    git
    home-manager
    htop
    openresolv
    s-tui
    undervolt
    vim
    virtmanager
    wget
    xarchiver
    xclip
  ];

  services.emacs.enable = true;
  services.emacs.defaultEditor = true;

  fonts.fonts = with pkgs; [tlwg];
  programs.ssh.startAgent = true;
  networking.firewall.enable = false;

  security.wrappers.hddtemp.source = "${pkgs.hddtemp}/bin/hddtemp";

  # Enable sound.
  sound.enable = true;
  sound.mediaKeys.enable = true;

  hardware.trackpoint.device = "TPPS/2 Elan TrackPoint";

  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.package = pkgs.pulseaudioFull;
  hardware.pulseaudio.support32Bit = true;
  hardware.pulseaudio.zeroconf.discovery.enable = true;
  hardware.pulseaudio.zeroconf.publish.enable = true;
  hardware.pulseaudio.extraModules = with pkgs; [ pulseaudio-modules-bt ];
  hardware.pulseaudio.configFile = /etc/nixos/pulseaudio/default.pa;
  hardware.pulseaudio.daemon.config = {
    avoid-resampling = "yes";
    resample-method = "speex-fixed-10";
    default-sample-rate = 48000;
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.package = pkgs.bluezFull;
  services.blueman.enable = true;

  powerManagement.powerDownCommands = ''
    ${pkgs.bluez}/bin/bluetoothctl power off
    docker stop $(docker ps -q)
  '';

  hardware.sensor.iio.enable = true;

  hardware.opengl.enable = true;
  hardware.opengl.extraPackages = with pkgs; [
    vaapiIntel
    vaapiVdpau
    libvdpau-va-gl
    intel-media-driver
  ];

  services.udev.packages = with pkgs; [ libu2f-host ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.autorun = true;
  services.xserver.dpi = 216;
  services.xserver.exportConfiguration = true;
  services.xserver.videoDrivers = [ "intel" ];

  services.xserver.monitorSection = ''
    DisplaySize 344 193
  '';

  services.xserver.layout = "us";
  services.xserver.xkbVariant = "colemak";
  services.xserver.xkbOptions = "eurosign:e";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.inputMethod.enabled = "fcitx";
  i18n.inputMethod.fcitx.engines = with pkgs.fcitx-engines; [ unikey ];

  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  users.mutableUsers = true;
  users.groups.ndao = {
    name = "ndao";
    gid = 1000;
  };
  users.users.ndao = {
    group = "ndao";
    isNormalUser = true;
    uid = 1000;
    home = "/home/ndao";
    description = "nathan";
    extraGroups = [
	    "ndao"
	    "sound"
      "audio"
      "docker"
      "kvm"
      "libvirt"
      "networkmanager"
      "pulse"
      "wheel"
    ];
  };

  programs.dconf.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "19.09"; # Did you read the comment?
}
