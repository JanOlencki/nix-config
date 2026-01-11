{
  pkgs,
  ...
}:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {
      editor = {
        true-color = true;
        color-modes = true;
        line-number = "relative";
        cursor-shape.insert = "underline";
        auto-pairs = false;
        inline-diagnostics.cursor-line = "hint";
        end-of-line-diagnostics = "warning";
        inline-diagnostics.other-lines = "error";
      };
      keys.normal = {
        space.l = [
          ":new"
          ":insert-output lazygit"
          ":buffer-close!"
          ":redraw"
        ];
        space.L = [
          ":sh rm -f /tmp/unique-file"
          ":insert-output yazi %{buffer_name} --chooser-file=/tmp/unique-file"
          '':insert-output echo "\x1b[?1049h\x1b[?2004h" > /dev/tty''
          ":open %sh{cat /tmp/unique-file}"
          ":redraw"
        ];
      };
    };
    languages = {
      language-server = {
        ltex-ls = {
          command = "${pkgs.ltex-ls}/bin/ltex-ls";
        };
      };
      language = [
        {
          name = "git-commit";
          "language-servers" = [
            "ltex-ls"
          ];
        }
        {
          name = "markdown";
          language-servers = [
            "ltex-ls"
          ];
          file-types = [
            "md"
            "txt"
          ];
          scope = "text.markdown";
        }
      ];
    };
  };
}
