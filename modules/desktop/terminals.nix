{
  config,
  pkgs,
  ...
}:

{
  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.kitty.enable
  programs.kitty = {
    package = config.lib.nixGL.wrap pkgs.kitty;
    enable = true;
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
}
{
  # config,
  # pkgs,
  ...
}:

{
  # https://nix-community.github.io/home-manager/options/home-manager/programs/wezterm.html
  programs.wezterm = {
    enable = true;
    # package = config.lib.nixGL.wrap pkgs.wezterm;
    enableBashIntegration = true;
    enableZshIntegration = true;
    extraConfig = builtins.readFile ./configs/wezterm/wezterm.lua;
  };
}
