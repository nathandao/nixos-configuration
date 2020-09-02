{ lib, config, pkgs,... }:
{
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
  services.xserver.displayManager.lightdm.greeters.tiny.extraConfig = ''
    /* GTK UI CSS */
    static const gchar *style =
    "window {"
        "background-color: #292929;"
        "background-image: url('/usr/share/backgrounds/lightdm.png');"
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
}
