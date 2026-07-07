{ pkgs, ... }:

let
  templates = import ../../templates/templates.nix;
  templateNames = builtins.attrNames templates;
  configs = import ../../configs.nix;
  configNames = builtins.attrNames configs;
in
{
  home.packages = [
    (pkgs.writeShellApplication {
      name = "nfi";

      text = ''
        templates=(${builtins.concatStringsSep " " templateNames})

        usage() {
          echo "Usage: nfi <template>"
          echo
          echo "Available templates:"
          for template in "''${templates[@]}"; do
            echo "  - $template"
          done
        }

        if [ $# -ne 1 ]; then
          usage
          exit 1
        fi

        for template in "''${templates[@]}"; do
          if [ "$1" = "$template" ]; then
            exec nix flake init -t "$HOME/.config/home-manager#$1"
          fi
        done

        echo "Unknown template: $1"
        echo
        usage
        exit 1
      '';
    })

    (pkgs.writeShellApplication {
      name = "hms";

      text = ''
        configs=(${builtins.concatStringsSep " " configNames})

        usage() {
          echo "Usage: hms <config>"
          echo
          echo "Available configs:"
          for config in "''${configs[@]}"; do
            echo "  - $config"
          done
        }

        if [ $# -ne 1 ]; then
          usage
          exit 1
        fi

        for config in "''${configs[@]}"; do
          if [ "$1" = "$config" ]; then
            exec home-manager switch \
              --flake "$HOME/.config/home-manager#$1" \
              -b backup
          fi
        done

        echo "Unknown Home Manager configuration: $1"
        echo
        usage
        exit 1
      '';
    })
  ];
}
