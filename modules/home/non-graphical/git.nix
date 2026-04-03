{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    git-absorb
  ];

  programs.git = {
    enable = true;
    ignores = [
      ".direnv"
      ".envrc"
      ".helix"
    ];
    settings = {
      gpg.format = "ssh";
      core.editor = "${pkgs.helix}/bin/hx";
      commit.verbose = true;
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
  };

  programs.diff-so-fancy = {
    enable = true;
    enableGitIntegration = true;
    settings = {
      markEmptyLines = false;
      stripLeadingSymbols = false;
    };
  };

  programs.lazygit = {
    enable = true;
  };
}
