{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellApplication {
      name = "nfi";

      text = ''
        if [ $# -ne 1 ]; then
          echo "Usage: nfi <template-name>"
          exit 1
        fi

        nix flake init -t "$HOME/.config/home-manager#$1"
      '';
    })
  ];
}
