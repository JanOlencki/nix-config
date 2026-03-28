{
  pkgs,
  ...
}:
{
  imports = [
    ./shell.nix
    ./helix.nix
    ./git.nix
    ./yazi.nix
    ./zellij.nix
  ];

  programs.home-manager.enable = true;

  home.sessionVariables = {
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    MANROFFOPT = "-c";
  };

  home.packages = with pkgs; [
    nil
    nix-output-monitor
    nh
    ranger
    edir
    dust
    ltex-ls
    tldr
    sd
    ouch
    serpl
    python3Packages.ptpython
  ];

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks."*" = {
      forwardAgent = false;
      addKeysToAgent = "yes";
    };
  };
  services.ssh-agent.enable = true;

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
}
