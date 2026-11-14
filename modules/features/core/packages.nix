{ pkgs, pkgs-unstable, ... }:

{
  home.packages = [
    pkgs.baobab

    pkgs.curl

    pkgs.dnsutils

    pkgs.gdu

    pkgs.nil
    pkgs.nixd
    pkgs.nixfmt

    pkgs.tokei
    pkgs.tuios

    pkgs.unzip

    pkgs.wget
    pkgs.witr

    pkgs.yq-go

    pkgs-unstable.devenv # TODO remove in 26.11
  ];
}
