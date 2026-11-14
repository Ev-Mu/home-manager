{
  pkgs,
  stateVersion,
  ...
}:
{
  imports = [
    ./modules/options.nix
    ./activation.nix
  ];

  # Keep this at the version first used for this home, even as inputs advance.
  home.stateVersion = stateVersion;

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
    gc = {
      automatic = true;
      dates = "weekly";
    };
  };

  news.display = "silent";
}
