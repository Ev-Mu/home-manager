{ pkgs, pkgs-unstable, ... }:

{
  home.packages = [
    pkgs.kubectl

    (pkgs.wrapHelm pkgs.kubernetes-helm { plugins = [ pkgs.kubernetes-helmPlugins.helm-diff ]; })
  ];
}
