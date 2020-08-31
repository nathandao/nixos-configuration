## Custom nixos configuration

This is a config tuned specifically for my Lenovo X1 Extreme laptop, but most of the configs should be applicable to other hardware.

I'm currently refactoring the configs, so things are still pretty messy at the moment, although`power-managerment` and `vpn`are in pretty decent shape.

Virtualisations files are include, but left out of the main config at the moment, after a failed attempt of getting PCI passthrough to work for my X1 Extreme GPU.

### Overview of the setup:

- Currently using unstable nixos branch and kernel 5.8. Needed to push for 5.8 for the newly added dual fan support for thinkpads that come with 2 of those. It's quite satisfying seeing 2 fans being reported in `s-tui` :D
- LightDm with using the `tiny` theme with a customized gtk theme.
- Xfce+xmonad
- Bumblebee to spawn up the nvidia card when needed. Since the HDMI chip is mounted to nvidia, `intel-virtual-output` can be used for external monitor.
- Quite agressive power managerment with undervolt, tpl and a bunch of kernel params. Check `nixos/power-manager.nix` for more details. I have been able to get 7 - 9 hours of battery life with my normal work (1 or 2 node process running, docker containes, emacs and some firefox tabs). Which based on my research is pretty good for a x1e with 4k panel.
