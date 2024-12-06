{ config, pkgs, ... }:

{
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  environment.systemPackages = with pkgs; [
    virtiofsd
  ];

  # For a virtual machine
  fileSystems."/home/vmhf/Share" = {
    device = "share";
    fsType = "virtiofs";
    options = [ "defaults" ];
  };

  services.spice-vdagentd.enable = true;
}
