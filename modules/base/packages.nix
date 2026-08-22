{ pkgs, pkgs-unstable, ... }:

{
  home.packages = [
    pkgs.baobab

    pkgs.curl

    pkgs.gdu
    pkgs.git

    pkgs.kubectl

    pkgs.gnumakgite

    pkgs.ncdu
    pkgs.nil
    pkgs.nixd
    pkgs.nixfmt

    (pkgs.wrapHelm pkgs.kubernetes-helm { plugins = [ pkgs.kubernetes-helmPlugins.helm-diff ]; })

    pkgs.tokei

    pkgs.unzip

    pkgs.wget

    pkgs.yq-go

    pkgs-unstable.devenv

    pkgs-unstable.prettier
  ];
}
