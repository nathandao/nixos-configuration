{config, lib, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [ openresolv ];

  services.openvpn.servers = {
    futuHelsinki = {
      config = ''
        config /etc/nixos/vpn/config/futu-helsinki.ovpn
      '';
      autoStart = false;
      updateResolvConf = true;
      authUserPass.username = "";
      authUserPass.password = "";
    };
    futuTampere = {
      config = ''
        config /etc/nixos/openvpn/futu-tampere.ovpn
      '';
      autoStart = false;
      updateResolvConf = true;
      authUserPass.username = "";
      authUserPass.password = "";
    };
  };
}
