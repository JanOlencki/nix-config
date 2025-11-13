{helix, ...}: {
  lib,
  pkgs,
  ...
}: {
  home = {
    sessionVariables = {
      MANPAGER = "sh -c 'col -bx | bat -l man -p'";
      MANROFFOPT = "-c";
      SHELL = "${pkgs.fish}/bin/fish";
    };
  };

  home.packages = with pkgs; [
    nil
    nix-output-monitor
    nh
    ranger
    edir
    du-dust
    ltex-ls
    tldr
    sd
    git-absorb
    ouch
    serpl
  ];

  programs.home-manager.enable = true;

  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
  };
  services.ssh-agent.enable = true;

  programs.git = {
    enable = true;
    ignores = [
      ".direnv"
      ".envrc"
      ".helix"
    ];
    extraConfig = {
      gpg.format = "ssh";
      core.editor = "${helix.packages.${pkgs.system}.default}/bin/hx";
      commit.verbose = true;
      commit.gpgsign = true;
      diff.wsErrorHighlight = "all";
      diff.submodule = "log";
      interactive.singleKey = true;
      push.autoSetupRemote = true;
      status.submoduleSummary = -1;
      submodule.fetchJobs = 0;
      rebase.missingCommitsCheck = "warn";
      alias = {
        a = "add";
        ap = "add -p";
        c = "commit";
        sw = "switch";
        st = "status -sb";
        ls = "log --oneline";
        ll = "log --stat";
        lt = "log --graph --oneline";
        llt = "log --graph --stat";
        last = "log -1 HEAD --stat";
        r = "rebase";
        rc = "rebase --continue";
        ra = "rebase --abort";
        rebi = "rebase -i --autostash --autosquash";
        puf = "push --force-with-lease";
      };
    };
    diff-so-fancy = {
      enable = true;
      markEmptyLines = false;
      stripLeadingSymbols = false;
    };
  };

  programs.lazygit = {
    enable = true;
  };

  programs.lsd = {
    enable = true;
  };

  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [
      batman
      batgrep
    ];
  };
  programs.fd.enable = true;
  programs.ripgrep.enable = true;
  programs.zoxide.enable = true;
  programs.fzf.enable = true;
  programs.btop.enable = true;
  programs.direnv.enable = true;

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
            on = ["g" "i"];
            run = "plugin lazygit";
            desc = "run lazygit";
          }
        ];
      };
      "plugin" = {
        "prepend_fetchers" = [
          {
            id = "git";
            name = "*";
            run = "git";
          }
          {
            id = "git";
            name = "*/";
            run = "git";
          }
        ];
      };
    };
  };

  programs.helix = {
    enable = true;
    package = helix.packages.${pkgs.system}.default;
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
          file-types = ["md" "txt"];
          scope = "text.markdown";
        }
        {
          name = "nix";
          formatter = {
            command = "nix";
            args = ["fmt"];
          };
        }
      ];
    };
  };
  programs.zellij = {
    enable = true;
    settings = {
      show_startup_tips = false;
      advanced_mouse_actions = false;
      keybinds.locked = {
        "bind \"Alt h\"" = {MoveFocusOrTab = "Left";};
        "bind \"Alt l\"" = {MoveFocusOrTab = "Right";};
        "bind \"Alt j\"" = {MoveFocus = "Down";};
        "bind \"Alt k\"" = {MoveFocus = "Up";};
      };
    };
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      g = "git";
      copy = "wl-copy";
      paste = "wl-paste";
    };
    functions = {
      fish_greeting = ''
        date +"%A, %d %B %Y, %r"
        echo "Host: $(domainname -af)"
        echo "User: $USER"
      '';
      fish_title = ''
        echo "$USER@$(hostname -f)"
      '';
      ssh-list-add-keys = ''
        echo "SSH Keys:"; ssh-add -l || ssh-add
      '';
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      format = lib.concatStrings [
        "$directory"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_metrics"
        "$git_status"
        "$nix_shell"
        "$cmd_duration"
        "$line_break"
        "$jobs"
        "$battery"
        "$status"
        "$character"
      ];
      character = {
        success_symbol = "[\\$](green)";
        error_symbol = "[\\$](bold red)";
      };
      directory = {
        substitutions = {
          "~/ws/" = "";
        };
        truncate_to_repo = false;
        truncation_length = 0;
      };
      cmd_duration.format = "[\\[$duration\\]]($style)";
      git_branch = {
        format = "[\\[$symbol$branch\\]]($style)";
        symbol = "";
      };
      git_status = {
        format = "([\\[$all_status$ahead_behind\\]]($style))";
        ahead = "⇡$count";
        diverged = "⇡$ahead_count ⇣$behind_count";
        behind = "⇣$count";
      };
      nix_shell = {
        format = "[\\[$symbol\\]]($style)";
        symbol = "❄";
      };
    };
  };
}
