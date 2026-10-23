{ pkgs, pkgs-unstable, ... }:

{
  home.packages = [
    pkgs.brave
    pkgs.zed-editor
    pkgs-unstable.devin-desktop
  ];
}
