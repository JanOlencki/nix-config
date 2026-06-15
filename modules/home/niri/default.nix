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
in
{
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

  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings = {
      xwayland-satellite.enable = true;
      xwayland-satellite.path = pkgs.lib.getExe pkgs.xwayland-satellite;
      prefer-no-csd = true;
      spawn-at-startup = [
        {
          command = [
            "noctalia-shell"
          ];
        }
      ];
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
        gaps = 2;
        struts = {
          top = 0;
          left = 0;
          right = 0;
          bottom = 1;
        };
        preset-column-widths = [
          { proportion = 0.5; }
          { proportion = 2. / 3.; }
          { proportion = 1. / 3.; }
        ];
      };
      gestures = {
        hot-corners.enable = false;
      };
      window-rules = [
        {
          matches = [
            {
              app-id = "firefox";
            }
          ];
          open-maximized = true;
          clip-to-geometry = true;
        }

        {
          matches = [
            {
              app-id = "wezterm";
            }
          ];
          open-maximized = true;
        }

        {
          matches = [
            {
              app-id = "firefox";
              title = "Extension:.*";
            }
          ];
          open-floating = true;
        }
      ];
      hotkey-overlay = {
        skip-at-startup = true;
        hide-not-bound = true;
      };
    };
  };
}
