{
  pkgs,
  ...
}:
{
  imports = [
    ./non-graphical.nix
  ];

  # Desktop environment and display manager
  programs.niri.enable = true;
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.gnome.gnome-keyring.enable = true;

  # Nix
  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    extra-substituters = [
    ];
    extra-trusted-public-keys = [
    ];
  };

  services.xserver = {
    xkb.layout = "pl";
    xkb.variant = "";
  };

  services.udisks2.enable = true;

  programs.yubikey-manager.enable = true;

  # Keyboard
  console.keyMap = "pl2";
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            capslock = "overload(control, esc)";
          };
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    sbctl
    exfat
    usbutils
    vial
  ];

  services.udev.packages = [
    pkgs.via
    pkgs.vial
  ];

  # Printing
  services.printing.enable = true;

  # Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Network
  networking.networkmanager.enable = true;

  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };
}
