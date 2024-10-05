{pkgs, ...}: {
  home.packages = with pkgs; [
    apptainer # It depends on overlay FSs
    fuse-overlayfs
    gocryptfs
    spotify
    discord
    ripdrag
    wl-clipboard
  ];

  programs.home-manager.enable = true;
  programs.firefox = {
    enable = true;
  };
  programs.vscode = {
    enable = true;
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
  programs.alacritty = {
    enable = true;
    settings = {
      shell = "fish";
    };
  };
}
