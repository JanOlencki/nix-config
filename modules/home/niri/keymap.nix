{ config, ... }:
{
  programs.niri.settings.binds = {
    "Mod+Space" = {
      action.spawn = [
        "noctalia-shell"
        "ipc"
        "call"
        "launcher"
        "toggle"
      ];
      hotkey-overlay.hidden = true;
    };

    "Mod+P" = {
      action.screenshot.show-pointer = false;
      hotkey-overlay.title = "Printscreen";

    };
    "Mod+Shift+P" = {
      action.screenshot-window = { };
      hotkey-overlay.title = "Printscreen window";
    };
    "Mod+Ctrl+P" = {
      action.screenshot-screen.show-pointer = false;
      hotkey-overlay.title = "Printscreen screen";
    };

    "XF86AudioRaiseVolume".action.spawn = [
      "noctalia-shell"
      "ipc"
      "call"
      "volume"
      "increase"
    ];
    "XF86AudioLowerVolume".action.spawn = [
      "noctalia-shell"
      "ipc"
      "call"
      "volume"
      "decrease"
    ];
    "XF86AudioMute".action.spawn = [
      "noctalia-shell"
      "ipc"
      "call"
      "volume"
      "muteOutput"
    ];

    "XF86AudioPrev".action.spawn = [
      "noctalia-shell"
      "ipc"
      "call"
      "media"
      "previous"
    ];
    "XF86AudioPlay".action.spawn = [
      "noctalia-shell"
      "ipc"
      "call"
      "media"
      "playPause"
    ];
    "XF86AudioNext".action.spawn = [
      "noctalia-shell"
      "ipc"
      "call"
      "media"
      "next"
    ];

    "XF86MonBrightnessUp".action.spawn = [
      "noctalia-shell"
      "ipc"
      "call"
      "brightness"
      "increase"
    ];
    "XF86MonBrightnessDown".action.spawn = [
      "noctalia-shell"
      "ipc"
      "call"
      "brightness"
      "decrease"
    ];

    "Mod+V" = {
      action.spawn = [
        "noctalia-shell"
        "ipc"
        "call"
        "launcher"
        "clipboard"
      ];
      hotkey-overlay.title = "Clipboard";
    };
    "Mod+C" = {
      action.spawn = [ "wezterm" ];
      hotkey-overlay.title = "Wezterm";
    };
    "Mod+O" = {
      action.spawn = [
        "noctalia-shell"
        "ipc"
        "call"
        "lockScreen"
        "lock"
      ];
      hotkey-overlay.title = "Lock";
    };
    "Mod+Shift+O" = {
      action.spawn = [
        "noctalia-shell"
        "ipc"
        "call"
        "sessionMenu"
        "toggle"
      ];
      hotkey-overlay.title = "Session menu";
    };
  }
  // (with config.lib.niri.actions; {
    "Mod+Slash" = {
      action = show-hotkey-overlay;
      hotkey-overlay.hidden = true;
    };
    "Mod+Q" = {
      action = close-window;
      hotkey-overlay.title = "Close window";
    };
    "Mod+MouseMiddle" = {
      action = close-window;
      hotkey-overlay.hidden = true;
    };
    "Mod+Shift+WheelScrollDown" = {
      action = focus-column-or-monitor-right;
      cooldown-ms = 150;
    };
    "Mod+Shift+WheelScrollUp" = {
      action = focus-column-or-monitor-left;
      cooldown-ms = 150;
    };
    "Mod+WheelScrollDown" = {
      action = focus-workspace-down;
      cooldown-ms = 150;
    };
    "Mod+WheelScrollUp" = {
      action = focus-workspace-up;
      cooldown-ms = 150;
    };
    "MouseForward" = {
      action = focus-column-or-monitor-left;
    };
    "MouseBack" = {
      action = focus-column-or-monitor-right;
    };
    "Mod+W" = {
      action = switch-preset-column-width;
    };
    "Mod+M" = {
      action = maximize-column;
    };
    "Mod+Tab" = {
      action = toggle-overview;
      hotkey-overlay.title = "Overview";
    };

    "Mod+S".action = set-dynamic-cast-window;
    "Mod+Shift+S".action = set-dynamic-cast-monitor;
    "Ctrl+Mod+S".action = clear-dynamic-cast-target;

    "Mod+H".action = focus-column-or-monitor-left;
    "Mod+Left".action = focus-column-or-monitor-left;
    "Mod+Shift+H".action = swap-window-left;
    "Mod+Shift+Left".action = swap-window-left;

    "Mod+J" = {
      action = focus-workspace-down;
      hotkey-overlay.hidden = true;
    };
    "Mod+Down" = {
      action = focus-workspace-down;
      hotkey-overlay.hidden = true;
    };
    "Mod+Shift+J" = {
      action = move-window-to-workspace-down;
      hotkey-overlay.hidden = true;
    };
    "Mod+Shift+Down" = {
      action = move-window-to-workspace-down;
      hotkey-overlay.hidden = true;
    };
    "Mod+K" = {
      action = focus-workspace-up;
      hotkey-overlay.hidden = true;
    };
    "Mod+Up" = {
      action = focus-workspace-up;
      hotkey-overlay.hidden = true;
    };
    "Mod+Shift+K" = {
      action = move-window-to-workspace-up;
      hotkey-overlay.hidden = true;
    };
    "Mod+Shift+Up" = {
      action = move-window-to-workspace-up;
      hotkey-overlay.hidden = true;
    };

    "Mod+L".action = focus-column-or-monitor-right;
    "Mod+Right".action = focus-column-or-monitor-right;
    "Mod+Shift+L".action = swap-window-right;
    "Mod+Shift+Right".action = swap-window-right;

    "Ctrl+Mod+J".action = move-workspace-down;
    "Ctrl+Mod+K".action = move-workspace-up;

    "Mod+F".action = fullscreen-window;
    "Mod+Shift+F".action = toggle-window-floating;
  });
}
