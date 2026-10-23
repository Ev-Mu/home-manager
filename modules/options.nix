{ lib, ... }:
{
  options.desktop-packages.enable = lib.mkEnableOption "desktop-specific package variants (e.g. GUI apps that have CLI counterparts)";
}
