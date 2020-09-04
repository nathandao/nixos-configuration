{ lib, config, pkgs,... }:
{
  environment.systemPackages = with pkgs; [
    lxappearance
    xfce.xfce4-cpufreq-plugin
    xfce.xfce4-xkb-plugin
    xorg.xf86videointel
    xorg.xmodmap
    xscreensaver
  ];

  # Adjust backlight
  programs.light.enable = true;
  services.actkbd = {
    enable = true;
    bindings = [
      { keys = [ 225 ]; events = [ "key" ]; command = "/run/current-system/sw/bin/light -A 4"; }
      { keys = [ 224 ]; events = [ "key" ]; command = "/run/current-system/sw/bin/light -U 4"; }
    ];
  };

  services.xserver.desktopManager.xfce.enable = true;
  services.xserver.desktopManager.xfce.enableXfwm = false;
  services.xserver.desktopManager.xfce.thunarPlugins = [ pkgs.xfce.thunar-archive-plugin ];
  services.xserver.displayManager.defaultSession = "xfce+xmonad";
  services.xserver.windowManager.xmonad.enable = true;
  services.xserver.windowManager.xmonad.enableContribAndExtras = true;

  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.lightdm.greeters.gtk.enable = false;
  services.xserver.displayManager.lightdm.greeters.gtk.cursorTheme.size = 48;
  services.xserver.displayManager.lightdm.greeters.tiny.enable = true;
  services.xserver.displayManager.lightdm.greeters.tiny.label.pass = "password";
  services.xserver.displayManager.lightdm.greeters.tiny.label.user = "username";
  services.xserver.displayManager.lightdm.greeters.tiny.extraConfig = (builtins.readFile ./tinytheme.c);
}
