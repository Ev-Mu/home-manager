{ pkgs, pkgs-unstable, ... }:

{
  home.packages = [
    pkgs.gnumake
    pkgs-unstable.glab
    pkgs-unstable.jira-cli-go
    pkgs-unstable.pixi
  ];

  # Generate completions declaratively into the Nix store.
  home.file.".local/share/zsh/site-functions/_glab".source =
    pkgs.runCommand "glab-zsh-completion" {
      nativeBuildInputs = [ pkgs-unstable.glab ];
    } ''
      export HOME="$TMPDIR"
      export XDG_CONFIG_HOME="$TMPDIR/.config"
      mkdir -p "$XDG_CONFIG_HOME"
      ${pkgs-unstable.glab}/bin/glab completion -s zsh > $out
    '';
}
