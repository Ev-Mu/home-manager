{ lib, pkgs, ... }:

{
  # Create a key only after Home Manager has crossed its write boundary.
  home.activation.createSshKey = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    [ ! -f ~/.ssh/id_ed25519.pub ] && ${pkgs.openssh.out}/bin/ssh-keygen -t ed25519 -N "" -f ~/.ssh/id_ed25519
  '';

  # Activation actions are ordered so the conflict check sees installed packages.
  home.activation.checkInstalled = lib.hm.dag.entryAfter [
    "onFilesChange"
    "reloadSystemd"
    "installPackages"
    "createSshKey"
  ] (builtins.readFile ./scripts/check-installed.sh);

  # Print shell setup guidance after the package conflict check.
  home.activation.addShells = lib.hm.dag.entryAfter [ "checkInstalled" ] (
    builtins.readFile ./scripts/change-shell.sh
  );
}
