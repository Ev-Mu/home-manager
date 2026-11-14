{
  imports = [
    ../modules/features/core
    ../modules/features/dev/work.nix
    ../modules/features/dev/kubernetes.nix
  ];

  home.username = "emusic";
  home.homeDirectory = "/home/emusic";
}
