{
  programs.noctalia-shell = {
    enable = true;
    systemd.enable = true;
    settings = {
      general = {
        compactLockScreen = true;
        showSessionButtonsOnLockScreen = false;
        avatarImage = null;
        enableLockScreenCountdown = false;
      };
      location = {
        weatherEnabled = false;
        weatherShowEffects = false;
      };
      sessionMenu = {
        enableCountdown = false;
        showHeader = false;
      };
      appLauncher = {
        terminalCommand = "wezterm -e";
      };
      wallpaper = {
        transitionType = "none";
      };
      ui = {
        settingsPanelMode = "centered";
      };
      nightLight = {
        enabled = true;
      };
      idle = {
        enabled = true;
        screenOffTimeout = 480;
        lockTimeout = 510;
        suspendTimeout = 1000;
      };
      controlCenter = {
        cards = [
          {
            enabled = true;
            id = "profile-card";
          }
          {
            enabled = true;
            id = "shortcuts-card";
          }
          {
            enabled = false;
            id = "audio-card";
          }
          {
            enabled = false;
            id = "brightness-card";
          }
          {
            enabled = false;
            id = "weather-card";
          }
          {
            enabled = false;
            id = "media-sysmon-card";
          }
        ];
        shortcuts = {
          left = [
            {
              id = "WiFi";
            }
            {
              id = "Bluetooth";
            }
            {
              id = "PowerProfile";
            }
          ];
          right = [
            {
              id = "Notifications";
            }
            {
              id = "KeepAwake";
            }
            {
              id = "NightLight";
            }
          ];
        };
      };
      bar = {
        position = "bottom";
        outerCorners = false;
        showCapsule = false;
        widgets = {
          left = [
            {
              icon = "rocket";
              id = "CustomButton";
              leftClickExec = "noctalia-shell ipc call launcher toggle";
            }
            {
              id = "Clock";
              usePrimaryColor = false;
              formatHorizontal = "HH:mm ddd, MMM dd";
              tooltipFormat = "HH:mm:ss (AP) dddd, dd MMMM yyyy";
            }
            {
              id = "SystemMonitor";
            }
            {
              id = "ActiveWindow";
            }
          ];
          center = [
            {
              id = "Workspace";
            }
          ];
          right = [
            {
              id = "MediaMini";
              showAlbumArt = true;
              maxWidth = 180;
            }
            {
              id = "Tray";
              drawerEnabled = false;
            }
            {
              id = "NotificationHistory";
            }
            {
              id = "Battery";
              displayMode = "icon-only";
              hideIfNotDetected = true;
              showPowerProfiles = true;
            }
            {
              id = "Volume";
              displayMode = "alwaysHide";
            }
            {
              id = "Brightness";
              displayMode = "alwaysHide";
            }
            {
              id = "ControlCenter";
              useDistroLogo = true;
              enableColorization = true;
              colorizeSystemIcon = "primary";
            }
          ];
        };
      };
    };
  };
}
