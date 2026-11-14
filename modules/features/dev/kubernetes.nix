{ pkgs, pkgs-unstable, ... }:

{
  home.packages = [
    pkgs.kubectl

    (pkgs.wrapHelm pkgs.kubernetes-helm { plugins = [ pkgs.kubernetes-helmPlugins.helm-diff ]; })
  ];

  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.k9s.enable
  programs.k9s = {
    enable = true;
  };
}
