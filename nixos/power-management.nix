{ config, lib, pkgs, ... }:

{
  powerManagement = {
    enable = true;
    powertop.enable = true;
  };

  boot.initrd.availableKernelModules = [ "battery" "i915" ];
  boot.extraModulePackages = with config.boot.kernelPackages; [ tp_smapi acpi_call ];
  boot.kernelModules = ["tp_smapi" "acpi_call" "i915"];
  boot.kernelParams = [
    # "pci_stub.ids=10de:1c8c,10de:0fb9"
    "intel_pstate=disable"

    "snd_hda_intel.power_save=1"
    "snd_hda_intel.power_save_controller=Y"

    "iwlmvm.power_scheme=3"

    "iwlwifi.power_save=Y"
    "iwlwifi.power_level=5"
    "iwlwifi.11n_disable=1"
    "iwlwifi.uapsd_disable=1"
    "iwlwifi.disable_11ac=Y"
    "iwlwifi.disable_11ax=Y"
    "iwlwifi.amsdu_size=4"

    "i915.enable_dc=4"
    "i915.enable_fbc=1"
    "i915.enable_guc=2"
    "i915.enable_psr=1"
    "i915.disable_power_well=1"
  ];


  services.thinkfan.enable = true;
  services.upower.enable = true;

  services.tlp = {
    enable = true;
    settings = {
      "MAX_LOST_WORK_SECS_ON_BAT" = 15;
      "RUNTIME_PM_BLACKLIST" = "01:00:0 01:00:1";
      # Batter charge threshold to better longevity
      "START_CHARGE_THRESH_BAT0" = 40;
      "STOP_CHARGE_THRESH_BAT0" = 85;
      # WiFi power saving mode: on=enable, off=disable; not supported by all adapters.
      # Default: <none>
      "WIFI_PWR_ON_BAT" = "on";
      # Disable wake on LAN: Y/N.
      # Default: N
      "WOL_DISABLE" = "Y";
      # Intel GPU freq
      "INTEL_GPU_MIN_FREQ_ON_AC" = 0;
      "INTEL_GPU_MIN_FREQ_ON_BAT" = 0;
      "INTEL_GPU_MAX_FREQ_ON_AC" = 1100;
      "INTEL_GPU_MAX_FREQ_ON_BAT" = 400;
      "INTEL_GPU_BOOST_FREQ_ON_AC" = 1100;
      "INTEL_GPU_BOOST_FREQ_ON_BAT" = 500;

      # CPU
      "CPU_SCALING_GOVERNOR_ON_AC" = "schedutil";
      "CPU_SCALING_GOVERNOR_ON_BAT" = "schedutil";
      "CPU_SCALING_MIN_FREQ_ON_AC" = 800000;
      "CPU_SCALING_MAX_FREQ_ON_AC" = 2200000;
      "CPU_SCALING_MIN_FREQ_ON_BAT" = 800000;
      "CPU_SCALING_MAX_FREQ_ON_BAT" = 1500000;
      "CPU_MIN_PERF_ON_AC" = 0;
      "CPU_MAX_PERF_ON_AC" = 80;
      "CPU_MIN_PERF_ON_BAT" = 0;
      "CPU_MAX_PERF_ON_BAT" = 20;

      # CPU_ENERGY_PERF_POLICY_ON_AC=default
      "CPU_ENERGY_PERF_POLICY_ON_AC" = "power";
      "CPU_ENERGY_PERF_POLICY_ON_BAT" = "power";

      # CPU_HWP_ON_AC=default
      "CPU_HWP_ON_AC" = "default";
      "CPU_HWP_ON_BAT" = "power";

      "CPU_BOOST_ON_AC" = 0;
      "CPU_BOOST_ON_BAT" = 0;

      # Minimize number of used CPU cores/hyper-threads under light load conditions:
      #   0=disable, 1=enable.
      # Default: <none>
      "SCHED_POWERSAVE_ON_AC" = 1;
      "SCHED_POWERSAVE_ON_BAT" = 1;

      # Enable audio power saving for Intel HDA, AC97 devices (timeout in secs).
      # A value of 0 disables, >=1 enables power saving (recommended: 1).
      # Default: 0 (AC), 1 (BAT)
      "SOUND_POWER_SAVE_ON_AC" = 0;
      "SOUND_POWER_SAVE_ON_BAT" = 1;

      # Disable controller too (HDA only): Y/N.
      # Note: effective only when SOUND_POWER_SAVE_ON_AC/BAT is activated.
      # Default: Y
      "SOUND_POWER_SAVE_CONTROLLER" = "Y";

      # Runtime Power Management for PCI(e) bus devices: on=disable, auto=enable.
      # Default: <none>
      "RUNTIME_PM_ON_AC" = "on";
      "RUNTIME_PM_ON_BAT" = "auto";

      # PCI Express Active State Power Management (PCIe ASPM):
      #   default(*), performance, powersave.
      # (*) keeps BIOS ASPM defaults (recommended)
      # Default: <none>
      "PCIE_ASPM_ON_AC" = "performance";
      "PCIE_ASPM_ON_BAT" = "powersave";

      # AHCI link power management (ALPM) for disk devices:
      #   min_power, med_power_with_dipm(*), medium_power, max_performance.
      # (*) Kernel >= 4.15 required, then recommended.
      # Multiple values separated with spaces are tried sequentially until success.
      # Default: <none>
      "SATA_LINKPWR_ON_AC" = "med_power_with_dipm max_performance";
      "SATA_LINKPWR_ON_BAT" = "min_power med_power_with_dipm medium_power";

      "DEVICES_TO_DISABLE_ON_STARTUP" = "bluetooth";

      # USB
      "USB_AUTOSUSPEND_ON_AC" = 0;
      "USB_AUTOSUSPEND_ON_BAT" = 1;

      # Battery feature drivers: 0=disable, 1=enable
      # Default: 1 (all)
      "NATACPI_ENABLE" = 1;
      "TPACPI_ENABLE" = 1;
      "TPSMAPI_ENABLE" = 1;
    };
  };

  services.throttled = {
    enable = true;
    extraConfig = ''
      [GENERAL]
      # Enable or disable the script execution
      Enabled: True
      # SYSFS path for checking if the system is running on AC power
      Sysfs_Power_Path: /sys/class/power_supply/AC*/online

      ## Settings to apply while connected to Battery power
      [BATTERY]
      # Update the registers every this many seconds
      Update_Rate_s: 30
      # Max package power for time window #1
      # PL1_Tdp_W: 35
      PL1_Tdp_W: 10
      # Time window #1 duration
      PL1_Duration_s: 28
      # Max package power for time window #2
      PL2_Tdp_W: 35
      # Time window #2 duration
      PL2_Duration_S: 0.002
      # Max allowed temperature before throttling
      Trip_Temp_C: 85
      # Set cTDP to normal=0, down=1 or up=2 (EXPERIMENTAL)
      # cTDP: 1

      ## Settings to apply while connected to AC power
      [AC]
      # Update the registers every this many seconds
      Update_Rate_s: 5
      # Max package power for time window #1
      PL1_Tdp_W: 35
      # Time window #1 duration
      PL1_Duration_s: 28
      # Max package power for time window #2
      PL2_Tdp_W: 45
      # Time window #2 duration
      PL2_Duration_S: 0.002
      # Max allowed temperature before throttling
      Trip_Temp_C: 85
      # Set HWP energy performance hints to 'performance' on high load (EXPERIMENTAL)
      # HWP_Mode: True
      # Set cTDP to normal=0, down=1 or up=2 (EXPERIMENTAL)
      # cTDP: 0

      [UNDERVOLT]
      CORE: -150
      GPU: -150
      CACHE: -150
      UNCORE: -150
    '';
  };
}
