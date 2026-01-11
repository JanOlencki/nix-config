{
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
        window_content_alignment = {
          horizontal = 'Center',
          vertical = 'Center',
        },
        window_padding = {
          left = "0",
          right = "0",
          top = 0,
          bottom = 0,
        },
      }
    '';
  };
}
