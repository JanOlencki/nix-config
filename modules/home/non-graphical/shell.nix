{
  lib,
  pkgs,
  ...
}:
{
  home.sessionVariables.SHELL = "${pkgs.fish}/bin/fish";

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      if set -q ZELLIJ
      else
        zellij
      end
    '';
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
