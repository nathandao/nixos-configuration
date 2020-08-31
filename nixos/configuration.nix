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
      # ./virtualisation/vfio.nix
      # ./virtualisation/libvirt.nix
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
    # Avoid drivers tampering with Nvidia GPU - as an attempt to extract nvidia vbios
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
    lxappearance
    s-tui
    undervolt
    vim
    wget
    xarchiver
    xclip
    xfce.xfce4-cpufreq-plugin
    xfce.xfce4-xkb-plugin
    xorg.xf86videointel
    xorg.xmodmap
    xscreensaver
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
  hardware.pulseaudio.configFile = /etc/nixos/custom-config/pulseaudio/default.pa;
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

  # Adjust backlight
  programs.light.enable = true;
  services.actkbd = {
    enable = true;
    bindings = [
      { keys = [ 225 ]; events = [ "key" ]; command = "/run/current-system/sw/bin/light -A 4"; }
      { keys = [ 224 ]; events = [ "key" ]; command = "/run/current-system/sw/bin/light -U 4"; }
    ];
  };

  # services.postgresql = {
  #   enable = true;
  #   package = pkgs.postgresql_12;
  #   enableTCPIP = true;
  #   authentication = pkgs.lib.mkOverride 12 ''
  #     local all all trust
  #     host all all ::1/128 trust
  #   '';
  #   initialScript = pkgs.writeText "backend-initScript" ''
  #     CREATE ROLE nixcloud WITH LOGIN PASSWORD 'nixcloud' CREATEDB;
  #     CREATE DATABASE nixcloud;
  #     GRANT ALL PRIVILEGES ON DATABASE nixcloud TO nixcloud;
  #   '';
  # };
  # services.pgmanage.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.autorun = true;
  services.xserver.dpi = 216;
  services.xserver.exportConfiguration = true;

  services.xserver.videoDrivers = [ "intel" ];
  services.xserver.deviceSection = ''
    Option "VirtualHeads" "1"
    BusID "PCI:0:2:0"
    Option "NoAccel" "True"
    Option "DRI" "False"
    Option "TearFree" "true"
  '';
  services.xserver.monitorSection = ''
    DisplaySize 344 193
  '';
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
         EndSection

        Section "Screen"
          Identifier "Default Screen"
          Device "DiscreteNvidia"
        '';
      };
    })
  ];

  services.xserver.layout = "us";
  services.xserver.xkbVariant = "colemak";
  services.xserver.xkbOptions = "eurosign:e";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.inputMethod.enabled = "fcitx";
  i18n.inputMethod.fcitx.engines = with pkgs.fcitx-engines; [ unikey ];

  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  services.xserver.displayManager.lightdm.enable = true;

  services.xserver.displayManager.lightdm.greeters.gtk.enable = false;
  services.xserver.displayManager.lightdm.greeters.gtk.cursorTheme.size = 48;

  services.xserver.displayManager.lightdm.greeters.tiny.enable = true;
  services.xserver.displayManager.lightdm.greeters.tiny.label.pass = "password";
  services.xserver.displayManager.lightdm.greeters.tiny.label.user = "username";
  services.xserver.displayManager.lightdm.greeters.tiny.extraConfig = ''
/* GTK UI CSS */
static const gchar *style =
"window {"
    "background-color: #292929;"
    "background-image: url('/usr/share/backgrounds/000065.png');"
    "background-position: center;"
    "background-size: cover;"
    "background-repeat: no-repeat;"
"}"
"window * {"
    "font: bold 28px \"Tlwg Mono\";"
    "-gtk-dpi: 216;"
"}"
"#prompt_box {"
    "background-color: none;"
    "border-color: none;"
    "margin: 50px 1200px 50px 1200px;"
"}"

"label {"
    "color: black;"
    "margin-right: 25px;"
"}"
"entry {"
    "color: black;"
    "caret-color: transparent;"
    "background-color: none;"
    "caret-color: none;"
    "border-color: none;"
    "box-shadow: none;"
"}"
"#message_label {"
    "color: white;"
"}";
/* GTK UI XML*/
static const gchar *ui =
"<?xml version='1.0' encoding='UTF-8'?>"
"<interface>"
  "<requires lib='gtk+' version='3.20'/>"
  "<object class='GtkWindow' id='login_window'>"
    "<property name='name'>login_window</property>"
    "<property name='can_focus'>False</property>"
    "<property name='resizable'>False</property>"
    "<property name='accept_focus'>False</property>"
    "<property name='decorated'>False</property>"
    "<child>"
      "<placeholder/>"
    "</child>"
    "<child>"
      "<object class='GtkBox' id='login_box'>"
        "<property name='name'>login_box</property>"
        "<property name='visible'>True</property>"
        "<property name='can_focus'>False</property>"
        "<property name='valign'>center</property>"
        "<property name='vexpand'>True</property>"
        "<property name='orientation'>vertical</property>"
        "<child>"
          "<object class='GtkBox' id='prompt_box'>"
            "<property name='name'>prompt_box</property>"
            "<property name='visible'>True</property>"
            "<property name='can_focus'>False</property>"
            "<property name='spacing'>15</property>"
            "<property name='homogeneous'>True</property>"
            "<child>"
              "<object class='GtkLabel' id='prompt_label'>"
                "<property name='name'>prompt_label</property>"
                "<property name='visible'>True</property>"
                "<property name='can_focus'>False</property>"
                "<property name='halign'>end</property>"
              "</object>"
              "<packing>"
                "<property name='expand'>False</property>"
                "<property name='fill'>True</property>"
                "<property name='position'>0</property>"
              "</packing>"
            "</child>"
            "<child>"
              "<object class='GtkEntry' id='prompt_entry'>"
                "<property name='name'>prompt_entry</property>"
                "<property name='visible'>True</property>"
                "<property name='can_focus'>True</property>"
                "<property name='halign'>start</property>"
                "<property name='has_frame'>False</property>"
                "<property name='max_width_chars'>15</property>"
                "<property name='primary_icon_activatable'>False</property>"
                "<property name='secondary_icon_activatable'>False</property>"
                "<signal name='activate' handler='login_cb' swapped='no'/>"
              "</object>"
              "<packing>"
                "<property name='expand'>False</property>"
                "<property name='fill'>True</property>"
                "<property name='position'>1</property>"
              "</packing>"
            "</child>"
          "</object>"
          "<packing>"
            "<property name='expand'>False</property>"
            "<property name='fill'>True</property>"
            "<property name='position'>0</property>"
          "</packing>"
        "</child>"
        "<child>"
          "<object class='GtkLabel' id='message_label'>"
            "<property name='name'>message_label</property>"
            "<property name='visible'>True</property>"
            "<property name='can_focus'>False</property>"
            "<property name='halign'>center</property>"
            "<property name='width_chars'>25</property>"
            "<property name='max_width_chars'>50</property>"
          "</object>"
          "<packing>"
            "<property name='expand'>False</property>"
            "<property name='fill'>True</property>"
            "<property name='position'>1</property>"
          "</packing>"
        "</child>"
      "</object>"
    "</child>"
  "</object>"
"</interface>";
'';

  services.xserver.desktopManager.xfce.enable = true;
  services.xserver.desktopManager.xfce.enableXfwm = false;
  services.xserver.desktopManager.xfce.thunarPlugins = [ pkgs.xfce.thunar-archive-plugin ];

  services.xserver.displayManager.defaultSession = "xfce+xmonad";
  services.xserver.windowManager.xmonad.enable = true;
  services.xserver.windowManager.xmonad.enableContribAndExtras = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
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
	    "ndao" "networkmanager" "wheel" "docker"
	    "sound" "pulse" "audio" "kvm"
    ];
  };

  programs.dconf.enable = true;

  # virtualisation.sharedMemoryFiles = {
  #   looking-glass = {
  #     size = 32; # Needs to be a power of 2 for looking-glass
  #     user = "root";
  #     group = "root";
  #     mode = "666";
  #   };
  # };

  # virtualisation.libvirtd = {
  #   enable = true;
  #   qemuOvmf = true;
  #   qemuRunAsRoot = true;
  #   clearEmulationCapabilities = false;
  # };

  # virtualisation.vfio = {
  #   enable = true;
  #   IOMMUType = "intel";
  #   devices = [ "10de:1c8c" "10de:0fb9" ];
  #   blacklistNvidia = true;
  #   disableEFIfb = true;
  #   ignoreMSRs = true;
  #   applyACSpatch = false;
  # };

  # virtualisation.kvmgt.enable = true;
  # virtualisation.hypervGuest.enable = true;
  # virtualisation.hypervGuest.videoMode = "1920x1080";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "19.09"; # Did you read the comment?
}
