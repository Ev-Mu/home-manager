{ pkgs, pkgs-unstable, ... }:

{
  home.packages = [
    pkgs.gnumake
    pkgs-unstable.pixi
  ];
}
