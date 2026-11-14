{
  imports = [
    ../modules/features/core
    ../modules/features/desktop
    ../modules/platforms/generic-linux.nix
  ];

  home.username = "runner";
  home.homeDirectory = "/home/runner";
}
