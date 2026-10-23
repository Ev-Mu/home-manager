{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellApplication {
      name = "setup-games-mount";

      text = ''
        set -euo pipefail

        sudo install -Dm644 \
          ${./configs/home-emusic-games.mount} \
          /etc/systemd/system/home-emusic-games.mount
        sudo systemctl daemon-reload
        sudo systemctl enable --now home-emusic-games.mount
      '';
    })
  ];
}
