{ config, pkgs, ... }:
{
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    arduino
    arduino-cli
    chromium
    cypress
    firefox-bin
    gitAndTools.git-extras
    gnupg
    gparted
    keybase-gui
    lastpass-cli
    nix-index
    nodejs_latest
    p7zip
    patchelf
    pciutils
    pinentry
    postgresql
    powertop
    prusa-slicer
    slack
    spotify
    stress-ng
    systool
    teams
    tdesktop
    thunderbird
    vlc
  ];

  manual.manpages.enable = false;

  services.random-background.enable = true;
  services.random-background.imageDirectory = "/home/ndao/.config/backgrounds";
  services.random-background.interval = "5min";
}
