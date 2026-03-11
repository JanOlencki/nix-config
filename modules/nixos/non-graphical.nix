{ pkgs, ... }:
{
  time.timeZone = "Europe/Warsaw";
  i18n.defaultLocale = "en_US.UTF-8";

  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  security.sudo.configFile = "Defaults pwfeedback";
  # Packages
  virtualisation.podman.enable = true;
  environment.systemPackages = with pkgs; [
    git
  ];
}
