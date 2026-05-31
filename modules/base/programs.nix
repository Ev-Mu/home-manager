{ ... }:

{
  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.bat.enable
  programs.bat = {
    enable = true;
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.direnv.enable
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
    silent = true;
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.fd.enable
  programs.fd = {
    enable = true;
    hidden = true;
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.fzf.enable
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;

    defaultCommand = "fd --type f";
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.k9s.enable
  programs.k9s = {
    enable = true;
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.nix-index.enable
  programs.nix-index = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.vim.enable
  programs.vim = {
    enable = true;
    settings = {
      background = "dark";
      mouse = "a";
      number = true;
      relativenumber = true;
      tabstop = 2;
    };
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.yazi.enable
  programs.yazi = {
    enable = true;
    settings = {
      manager = {
        show_hidden = true;
        sort_dir_first = true;
        show_symlink = true;
        scrolloff = 8;
      };
    };
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.ripgrep.enable
  programs.ripgrep = {
    enable = true;
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.zoxide.enable
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    options = [
      "--cmd cd"
    ];
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.eza.enable
  programs.eza = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.zellij.enable
  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    exitShellOnExit = true;
    extraConfig = ''
      theme "catppuccin-mocha"
      show_startup_tips false
    '';
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.tmux.enable
  programs.tmux = {
    enable = true;
  };
}
