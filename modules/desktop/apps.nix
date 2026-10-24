{ pkgs, pkgs-unstable, ... }:

{
  home.packages = [
    pkgs.brave
    pkgs-unstable.devin-desktop
  ];
}
