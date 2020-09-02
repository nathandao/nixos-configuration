The repo contains primarity nixos configurations for my Lenovo X1 Extreme laptop, hope bits and pieces of this config are applicable else where too.

Refactor is still WIP at the moment, so things are still quite messy.

### Overview:

- On unstable nixos branch and kernel 5.8. Decided to go with 5.8 for the newly added dual fan support for such thinkpads models. Nothing seems to be borken as far as my daily usage goes, so fingers corssed! On the other hand, it's quite satisfying seeing 2 thinkpad fans being reported in `s-tui` :D
- Lightdm
- xfce+xmonad. Note: copy `.xprofile` and `.xmonad` from `dotfiles` folder to your home directory to have the session loaded correctly and have xmonad plays well with other xfce packages.
- Bumblebee to spawn up the nvidia card when needed. Since the HDMI chip is mounted to nvidia, `intel-virtual-output` is used to connect to external monitor.
- Quite agressive power managerment with undervolt, tpl and a bunch of kernel params. Check `nixos/power-manager.nix` for more details. Note: remember to adjust the undervolt settings to suit your CPU.

I have been able to hit 7 - 9 hour mark with my normal work load (1 or 2 nodejs process, bunch of docker containes, emacs and some firefox tabs), which I can't complain much about, considering mine also comes with a 4k panel :D
