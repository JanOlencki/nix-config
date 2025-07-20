{pkgs, ...}: {
  home.packages = with pkgs; [
    apptainer # It depends on overlay FSs
    fuse-overlayfs
    gocryptfs
    spotify
    discord
    ripdrag
    wl-clipboard

    ffmpeg
    imagemagick
  ];

  programs.home-manager.enable = true;
  programs.firefox = {
    enable = true;
  };
  programs.vscode = {
    enable = true;
    profiles.default = {
      keybindings = [
        {
          "key" = "alt+k";
          "command" = "workbench.action.nextEditorInGroup";
        }
        {
          "key" = "alt+j";
          "command" = "workbench.action.previousEditorInGroup";
        }
      ];
      userSettings = {
        "editor.codeLens" = false;
        "diffEditor.ignoreTrimWhitespace" = false;
        "editor.autoClosingBrackets" = "never";
        "editor.autoClosingOvertype" = "never";
        "editor.autoClosingQuotes" = "never";
        "editor.autoClosingDelete" = "never";
        "editor.acceptSuggestionOnCommitCharacter" = false;
        "editor.acceptSuggestionOnEnter" = "off";
        "editor.autoSurround" = "never";
        "editor.dragAndDrop" = false;
        "editor.minimap.enabled" = false;
        "editor.folding" = false;
        "editor.foldingHighlight" = false;
        "extensions.ignoreRecommendations" = true;
        "files.autoSave" = "onWindowChange";
      };
    };
  };
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      return {
        enable_tab_bar = false,
        window_close_confirmation = 'NeverPrompt',
        default_prog = { 'fish', '-l' },
        harfbuzz_features = {"calt=0", "clig=0", "liga=0"},
        mux_enable_ssh_agent = false,
        enable_scroll_bar = false,
        keys = {
          {
            key = '-',
            mods = 'CTRL',
            action = wezterm.action.DisableDefaultAssignment,
          },
          {
            key = '=',
            mods = 'CTRL',
            action = wezterm.action.DisableDefaultAssignment,
          },
          {
            key = '-',
            mods = 'CTRL|SHIFT',
            action = wezterm.action.IncreaseFontSize,
          },
          {
            key = '=',
            mods = 'CTRL|SHIFT',
            action = wezterm.action.DecreaseFontSize,
          }
        },
        window_padding = {
          left = "1cell",
          right = "1cell",
          top = 0,
          bottom = 0,
        },
      }
    '';
  };

  xdg.configFile."fontconfig/conf.d/53-disable-ligatures.conf".text = ''
    <?xml version='1.0'?>
    <!DOCTYPE fontconfig SYSTEM 'urn:fontconfig:fonts.dtd'>
    <fontconfig>
      <match target="font">
        <edit name="fontfeatures" mode="assign">
          <string>liga=0</string>
          <string>calt=0</string>
          <string>clig=0</string>
        </edit>
      </match>
    </fontconfig>
  '';
}
