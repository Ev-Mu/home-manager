{ pkgs, pkgs-unstable, ... }:

{
  home.packages = [
    pkgs-unstable.opencode-desktop
  ];
}
