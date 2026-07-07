{
  config,
  pkgs,
  lib,
  nixgl,
  profile,
  ...
}:
let
  # Function to import *.nix files in a dir
  importDir =
    dir:
    map (name: dir + "/${name}") (
      builtins.filter (name: lib.hasSuffix ".nix" name) (builtins.attrNames (builtins.readDir dir))
    );

  configs = import ./configs.nix;

  importModule =
    name:
    let
      path = ./modules + "/${name}";
    in
    if builtins.pathExists path then
      importDir path
    else
      throw "Module directory '${name}' does not exist.";

  configurations = builtins.mapAttrs (
    _: cfg: builtins.concatLists (map importModule cfg.modules)
  ) configs;
in
{
  imports = configurations.${profile} ++ [ ./activation.nix ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  # Enable the experimental nix-command and flakes
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    gc.dates = "weekly";
  };
}
