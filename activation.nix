{ lib, pkgs, ... }:

{
  # After switch check if ssh keys exist if not create them
  home.activation.createSshKey = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    [ ! -f ~/.ssh/id_ed25519.pub ] && ${pkgs.openssh.out}/bin/ssh-keygen -t ed25519 -N "" -f ~/.ssh/id_ed25519
  '';

  # Check for programs installed on ubuntu that will conflict with nix packages
  home.activation.checkInstalled = lib.hm.dag.entryAfter [
    "onFilesChange"
    "reloadSystemd"
    "installPackages"
    "createSshKey"
  ] (builtins.readFile ./scripts/check-installed.sh);

  home.activation.addShells = lib.hm.dag.entryAfter [ "checkInstalled" ] (
    builtins.readFile ./scripts/change-shell.sh
  );
}
