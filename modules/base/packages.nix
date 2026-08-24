{ pkgs, pkgs-unstable, ... }:

{
  home.packages = [
    pkgs.baobab

    pkgs.curl

    pkgs.dnsutils

    pkgs.gdu
    pkgs.gnumake

    pkgs.kubectl

    pkgs.ncdu
    pkgs.nil
    pkgs.nixd
    pkgs.nixfmt

    (pkgs.wrapHelm pkgs.kubernetes-helm { plugins = [ pkgs.kubernetes-helmPlugins.helm-diff ]; })

    pkgs.tokei

    pkgs.unzip

    pkgs.wget
    pkgs.witr

    pkgs.yq-go

    pkgs-unstable.devenv

    pkgs-unstable.prettier
  ];
}
