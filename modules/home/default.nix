{ pkgs, ... }:
{
  imports = [
    ./non-graphical
    ./niri
    ./terminal.nix
    ./browser.nix
    ./vscode.nix
  ];

  home.packages = with pkgs; [
    apptainer # It depends on overlay FSs
    fuse-overlayfs
    gocryptfs
    spotify
    discord
    ripdrag
    wl-clipboard
    waypipe

    ffmpeg
    imagemagick
    vlc
    kdePackages.dolphin
    kdePackages.okular
    libappindicator-gtk3
  ];

  programs.onlyoffice.enable = true;

  xdg.configFile."fontconfig/conf.d/53-disable-ligatures.conf".text = ''
    <?xml version='1.0'?>
    <!DOCTYPE fontconfig SYSTEM 'urn:fontconfig:fonts.dtd'>
    <fontconfig>
      <match target="font">
        <edit name="fontfeatures" mode="assign">
          <string>liga=0</string>
          <string>calt=0</string>
          <string>clig=0</string>
        </edit>
      </match>
    </fontconfig>
  '';
}
