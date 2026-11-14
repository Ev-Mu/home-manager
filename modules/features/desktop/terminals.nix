{ config, pkgs, ... }:

{
  imports = [ ];

  # https://nix-community.github.io/home-manager/options/home-manager/programs/kitty.html
  programs.kitty = {
    package = config.lib.nixGL.wrap pkgs.kitty;
    enable = false;
    themeFile = "kanagawa";
    shellIntegration = {
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };
    settings = {
      active_border_color = "#44ffff";
      background_blur = "64";
      background_opacity = "0.9";
      enabled_layouts = "Tall, *";
      shell = "zsh";
      single_windows_margin_width = 1;
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      window_border_width = "1pt";
      window_margin_width = "10";
    };
  };

  # https://nix-community.github.io/home-manager/options/home-manager/programs/wezterm.html
  programs.wezterm = {
    enable = false;
    enableBashIntegration = true;
    enableZshIntegration = true;
    extraConfig = builtins.readFile ./configs/wezterm/wezterm.lua;
  };

  # https://nix-community.github.io/home-manager/options/home-manager/programs/ghostty.html
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    systemd.enable = true;
    settings = {
      font-size = 10;
      keybind = [
        "ctrl+h=goto_split:left"
        "ctrl+l=goto_split:right"
      ];
      theme = "Ayu";
    };
  };
}
