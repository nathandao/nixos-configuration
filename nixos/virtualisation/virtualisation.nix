{lib, pkgs, conig, ...}:
{
  imports = [
    ./libvirt.nix
    ./vfio.nix
    ./virtualisation-conf.nix
  ]

  virtualisation.sharedMemoryFiles = {
    looking-glass = {
      size = 32; # Needs to be a power of 2 for looking-glass
      user = "root";
      group = "root";
      mode = "666";
    };
  };

  virtualisation.libvirtd = {
    enable = true;
    qemuOvmf = true;
    qemuRunAsRoot = true;
    clearEmulationCapabilities = false;
  };

  virtualisation.vfio = {
    enable = true;
    IOMMUType = "intel";
    devices = [ "10de:1c8c" "10de:0fb9" ];
    blacklistNvidia = true;
    disableEFIfb = true;
    ignoreMSRs = true;
    applyACSpatch = false;
  };
}
