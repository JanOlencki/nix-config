{
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
    ranger
    edir
    du-dust
    ltex-ls
    tldr
  ];

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    ignores = [
      ".direnv"
      ".envrc"
      ".helix"
    ];
    extraConfig = {
      core.editor = "${pkgs.helix}/bin/hx";
      commit.verbose = true;
      pager.show = "${pkgs.bat}/bin/bat";
      diff.wsErrorHighlight = "all";
      diff.submodule = "log";
      push.autoSetupRemote = true;
      status.submoduleSummary = -1;
      submodule.fetchJobs = 0;
      rebase.missingCommitsCheck = "warn";
      alias = {
        c = "commit";
        sw = "switch";
        st = "status -sb";
        ls = "log --oneline";
        ll = "log --stat";
        lt = "log --graph --oneline";
        llt = "log --graph --stat";
        last = "log -1 HEAD --stat";
        r = "rebase";
        rebi = "rebase -i --autostash --autosquash";
        puf = "push --force-with-lease";
      };
    };
    difftastic = {
      enable = true;
    };
  };
  programs.bat = {
    enable = true;
  };
  programs.lsd = {
    enable = true;
    enableAliases = true;
  };
  programs.yazi = {
    enable = true;
  };
  programs.zoxide.enable = true;
  programs.fzf = {
    enable = true;
  };
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
        file-picker = {
          hidden = false;
        };
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
      ];
    };
  };
  programs.direnv = {
    enable = true;
  };
  programs.zellij = {
    enable = true;
    settings = {
      pane_frames = false;
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
        echo "Hostname: $hostname"
        echo "User: $USER"
      '';
    };
  };
  programs.starship = {
    enable = true;
    settings = {
      format = lib.concatStrings [
        "$hostname"
        "$directory"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_metrics"
        "$git_status"
        "$nix_shell"
        "$custom"
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
