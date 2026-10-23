{ pkgs, pkgs-unstable, config, lib, ... }:
{
  home.packages =
    [
      pkgs-unstable.opencode
    ]
    ++ lib.optionals config.desktop-packages.enable [
      pkgs-unstable.opencode-desktop
    ];
}
