{
  programs.zellij = {
    enable = true;
    settings = {
      show_startup_tips = false;
      advanced_mouse_actions = false;
      keybinds.locked = {
        "bind \"Alt h\"" = {
          MoveFocusOrTab = "Left";
        };
        "bind \"Alt l\"" = {
          MoveFocusOrTab = "Right";
        };
        "bind \"Alt j\"" = {
          MoveFocus = "Down";
        };
        "bind \"Alt k\"" = {
          MoveFocus = "Up";
        };
      };
    };
  };
}
