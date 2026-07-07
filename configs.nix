# configs.nix
{
  base = {
    username = "emusic";
    homeDirectory = "/home/emusic";
    modules = [
      "base"
      "non-nixos"
    ];
  };

  base-nixos = {
    username = "emusic";
    homeDirectory = "/home/emusic";
    modules = [
      "base"
      "nixos"
    ];
  };

  nixos = {
    username = "emusic";
    homeDirectory = "/home/emusic";
    modules = [
      "base"
      "nixos"
      "gui"
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
