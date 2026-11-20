{
  imports = [
    ../modules/features/core
    ../modules/platforms/generic-linux.nix
  ];

  home.username = "runner";
  home.homeDirectory = "/home/runner";
}
