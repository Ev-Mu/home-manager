# configs.nix
{
  base = {
    username = "emusic";
    homeDirectory = "/home/emusic";
    modules = [
      "base"
      "ai"
      "platforms/generic-linux"
    ];
  };

  base-nixos = {
    username = "emusic";
    homeDirectory = "/home/emusic";
    modules = [
      "base"
      "ai"
      "platforms/nixos"
    ];
  };

  nixos = {
    username = "emusic";
    homeDirectory = "/home/emusic";
    modules = [
      "base"
      "ai"
      "desktop"
      "platforms/nixos"
    ];
  };

  cachyos = {
    username = "emusic";
    homeDirectory = "/home/emusic";
    modules = [
      "base"
      "ai"
      "desktop"
      "platforms/generic-linux"
      "platforms/cachyos"
    ];
  };

  work = {
    username = "emusic";
    homeDirectory = "/home/emusic";
    modules = [
      "base"
      "dev/work"
      "dev/kubernetes"
    ];
  };

  runner = {
    username = "runner";
    homeDirectory = "/home/runner";
    modules = [
      "base"
      "desktop"
      "platforms/generic-linux"
    ];
  };
}
