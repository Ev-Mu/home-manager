{ lib, ... }:
{
  imports = [
    ./terminals.nix
    ./editors.nix
    ./apps.nix
  ];

  # mkDefault lets a profile override this when it needs a different choice.
  desktop-packages.enable = lib.mkDefault true;
}
