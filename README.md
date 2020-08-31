The repo contains primarity nixos configurations for my Lenovo X1 Extreme laptop, hope bits and pieces of this config are applicable else where too.

Refactor is still WIP at the moment, so things are still very messy, although`power-managerment` and `vpn`are in pretty decent shape.

Virtualisations files `./nixos/kvm`(TODO: add sources from where I got those files from), are commented out in`configuration.nix`, after a failed attempt to get PCI passthrough to work for the x1 extreme's nvidia gpu.

### Overview of the setup:

- Currently using unstable nixos branch and kernel 5.8. Needed to push for 5.8 for the newly added dual fan support for such thinkpads models. Nothing seems to be borken so far, so fingers corssed! On the other hand, it's quite satisfying seeing 2 thinkpad fans being reported in `s-tui` :D
- Lightdm with a custom gtk theme.
- xfce+xmonad Will need to copy `.xprofile` and `.xmonad` from `dotfiles` folder to your home directory to make sure the session loads correctly. This basically stops all xfce apps from starting by default, and only starts `xfce4-panel` through xmonad. TODO: export my current xfce config and themes.
- Bumblebee to spawn up the nvidia card when needed. By default, nvidia should stays in deep sleep to preserve power especially in battery mode. Since the HDMI chip is mounted to nvidia, `intel-virtual-output` can be used for external monitor.
- Quite agressive power managerment with undervolt, tpl and a bunch of kernel params. Check `nixos/power-manager.nix` for more details. I have been able to hit 7 - 9 hour mark with my normal work load (1 or 2 nodejs process, bunch of docker containes, emacs and some firefox tabs), which I can't complain much about, considering mine also comes with a 4k panel :D
