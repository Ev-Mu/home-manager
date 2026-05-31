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

    (pkgs.writeShellApplication {
      name = "switch";

      text = ''
        if [ $# -eq 0 ]; then
          home-manager switch --flake "$HOME/.config/home-manager#base" -b backup
          exit 0
        fi

        home-manager switch --flake "$HOME/.config/home-manager#$1" -b backup
      '';
    })
  ];
}
