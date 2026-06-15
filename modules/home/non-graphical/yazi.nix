{
  pkgs,
  ...
}:
{
  programs.yazi = {
    enable = true;
    initLua = ''
      th.git = th.git or {}
      th.git.modified_sign = "M";
      th.git.added_sign = "A";
      th.git.untracked_sign = "?";
      th.git.ignored_sign = "I";
      th.git.deleted_sign = "D";
      th.git.updated_sign = "U";
      require("git"):setup()
    '';
    shellWrapperName = "y";
    plugins = {
      git = pkgs.yaziPlugins.git;
      outch = pkgs.yaziPlugins.ouch;
      mediainfo = pkgs.yaziPlugins.mediainfo;
      lazygit = pkgs.yaziPlugins.lazygit;
    };
    settings = {
      "mgr" = {
        prepend_keymap = [
          {
            on = [
              "g"
              "i"
            ];
            run = "plugin lazygit";
            desc = "run lazygit";
          }
          {
            on = [
              "?"
            ];
            run = "help";
          }
        ];
      };
      "plugin" = {
        "prepend_fetchers" = [
          {
            url = "*";
            run = "git";
            group = "git";
          }
          {
            url = "*/";
            run = "git";
            group = "git";
          }
        ];
      };
    };
  };
}
