{ config, pkgs, lib, ... }:
{
  security.pam.services.login.u2fAuth = true;
  security.pam.services.lightdm.u2fAuth = true;

  security.pam.yubico = {
    enable = true;
    control = "sufficient";
  };
}
