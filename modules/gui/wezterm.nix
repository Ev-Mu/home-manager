{ 
  config,
  pkgs,
  ... 
}:

{
  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.wezterm.enable
  programs.wezterm = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.wezterm;
    enableBashIntegration = true;
    enableZshIntegration = true;
    extraConfig = builtins.readFile ./configs/wezterm/wezterm.lua;
  };
}
