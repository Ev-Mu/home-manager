{ pkgs, pkgs-unstable, ... }:

{
  home.packages = [
    pkgs.brave
    pkgs-unstable.actual-client
    pkgs-unstable.devin-desktop
  ];
}
