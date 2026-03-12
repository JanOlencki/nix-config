{
  pkgs,
  ...
}:
  let
  sessionVariables = {
    GDK_BACKEND = "wayland";
    QT_QPA_PLATFORM = "wayland";
    QT_STYLE_OVERRIDE = "kvantum";
    SDL_VIDEODRIVER = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    OZONE_PLATFORM = "wayland";
    NIXOS_OZONE_WL = "1";
  };
    in {
  imports = [
    ./keymap.nix
    ./noctalia.nix
  ];
  home = {
    inherit sessionVariables;
  };

  services.udiskie = {
    enable = true;
    tray = "never";
    settings = {
      program_options = {
        file_manager = "${pkgs.kdePackages.dolphin}/bin/dolphin";
      };
    };
  };

  systemd.user.services.noctalia-shell.Service.Environment = [
    "NOCTALIA_SETTINGS_FALLBACK=%h/.config/noctalia/gui-settings.json"
    "GDK_BACKEND=wayland"
    "QT_QPA_PLATFORM=wayland"
    "QT_STYLE_OVERRIDE=kvantum"
    "SDL_VIDEODRIVER=wayland"
    "MOZ_ENABLE_WAYLAND=1"
    "ELECTRON_OZONE_PLATFORM_HINT=wayland"
    "OZONE_PLATFORM=wayland"
    "NIXOS_OZONE_WL=1"
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings = {
      xwayland-satellite.enable = true;
      xwayland-satellite.path = pkgs.lib.getExe pkgs.xwayland-satellite;
      prefer-no-csd = true;
      cursor.size = 48;
      input = {
        focus-follows-mouse.enable = true;
        mouse.accel-profile = "flat";
        touchpad = {
          accel-profile = "flat";
          click-method = "clickfinger";
        };
        warp-mouse-to-focus.enable = true;
      };
      layout = {
        default-column-width.proportion = 0.5;
        focus-ring.width = 2;
        gaps = 4;
        struts = {
          top = 0;
          left = 1;
          right = 1;
          bottom = 1;
        };
        preset-column-widths = [
          { proportion = 0.5; }
          { proportion = 2. / 3.; }
          { proportion = 1. / 3.; }
        ];
      };
      window-rules = [
        {
          matches = [
            {
              app-id = "firefox";
            }
          ];
          open-maximized = true;
        }
      ];
      hotkey-overlay = {
        skip-at-startup = true;
        hide-not-bound = true;
      };
    };
  };
}
