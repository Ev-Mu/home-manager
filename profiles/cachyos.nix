{
  imports = [
    ../modules/features/core
    ../modules/features/ai
    ../modules/features/desktop
    ../modules/platforms/generic-linux.nix
    ../modules/platforms/cachyos
  ];

  home.username = "emusic";
  home.homeDirectory = "/home/emusic";
}
