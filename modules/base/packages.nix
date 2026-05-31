{ pkgs, pkgs-unstable, ... }:

{
  home.packages = [
    pkgs.baobab

    pkgs.curl

    pkgs.gdu
    pkgs.git

    pkgs.kubectl

    pkgs.gnumake

    pkgs.ncdu
    pkgs.nixfmt

    (pkgs.wrapHelm pkgs.kubernetes-helm { plugins = [ pkgs.kubernetes-helmPlugins.helm-diff ]; })

    pkgs.ruff

    pkgs.tokei

    pkgs.unzip

    pkgs.wget

    pkgs.yq-go

    pkgs-unstable.devenv

    pkgs-unstable.prettier
  ];
}
