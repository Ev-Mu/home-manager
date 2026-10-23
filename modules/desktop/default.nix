{ lib, ... }:
{
  imports = [
    ./terminals.nix
    ./editors.nix
    ./apps.nix
  ];

  desktop-packages.enable = lib.mkDefault true;
}
