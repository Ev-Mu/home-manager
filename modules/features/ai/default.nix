{
  pkgs,
  pkgs-unstable,
  config,
  lib,
  ...
}:
{
  home.packages = [
    pkgs-unstable.opencode
    pkgs-unstable.codex
  ]
  # Desktop profiles opt into GUI variants; CLI-only profiles stay lightweight.
  ++ lib.optionals config.desktop-packages.enable [
    pkgs-unstable.opencode-desktop
  ];
}
