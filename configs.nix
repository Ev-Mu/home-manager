# configs.nix
{
  base = {
    username = "emusic";
    homeDirectory = "/home/emusic";
    modules = [
      "base"
      "non-nixos"
      "ai/non-gui"
    ];
  };

  base-nixos = {
    username = "emusic";
    homeDirectory = "/home/emusic";
    modules = [
      "base"
      "nixos"
      "ai/non-gui"
    ];
  };

  nixos = {
    username = "emusic";
    homeDirectory = "/home/emusic";
    modules = [
      "base"
      "nixos"
      "gui"
      "ai/non-gui"
      "ai/gui"
    ];
  };

  cachyos = {
    username = "emusic";
    homeDirectory = "/home/emusic";
    modules = [
      "base"
      "cachyos"
      "non-nixos"
      "gui"
      "ai/non-gui"
      "ai/gui"
    ];
  };

  work = {
    username = "emusic";
    homeDirectory = "/home/emusic";
    modules = [
      "base"
      "work"
      "kubernetes"
    ];
  };

  runner = {
    username = "runner";
    homeDirectory = "/home/runner";
    modules = [
      "base"
      "non-nixos"
      "gui"
    ];
  };
}
