{ ... }:

let
  sessionVariables = {
    EDITOR = "nvim";
    PATH = "$PATH:$HOME/.config/home-manager/bin:$HOME/.nix-profile/bin:$HOME/.local/bin";
    HISTCONTROL = "ignoreboth:erasedups";
    DIRENV_LOG_FORMAT = "";
  };
  shellAliases = {
    c = "clear";
    cat = "bat";
    db = "devbox";
    clean-docker = "docker system df && docker container prune -f && docker image prune -f && docker builder prune -f && docker volume prune -a -f && docker system df";
    grep = "rg";
    la = "eza --icons --group-directories-first -a";
    ll = "eza --icons --group-directories-first -lh";
    lla = "eza --icons --group-directories-first -lah";
    ls = "eza --icons --group-directories-first";
    lt = "eza --icons --tree";
    make-keys = "ssh-keygen -t rsa -b 4096";
    switch = "home-manager switch --flake $HOME/.config/home-manager#$USER -b backup";
    switch-gui = "home-manager switch --flake $HOME/.config/home-manager#$USER-gui -b backup";
    rebuild = "sudo nixos-rebuild switch --flake $HOME/.config/nixos#$USER";
  };
  shellExtras =
    { shell }:
    ''
      # Custom file to put things that shouldnt be public
      if [ -f "$HOME/.${shell}rc_extras" ]; then
        . "$HOME/.${shell}rc_extras"
      fi

      # https://worktrunk.dev/config/
      eval "$(wt config shell init ${shell})"

      # # Always start zellij outside vscode and non-interactive shells
      # if [[ $- == *i* ]] \
      #   && command -v zellij >/dev/null 2>&1 \
      #   && [ -z "$ZELLIJ" ] \
      #   && [ "$TERM_PROGRAM" != "vscode" ]; then
      #     zellij attach default -c
      # fi
    '';
in
{
  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.bash.enable
  programs.bash = {
    enable = true;
    sessionVariables = sessionVariables;
    shellAliases = shellAliases;
    initExtra = shellExtras { shell = "bash"; };
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.fish.enable
  programs.fish = {
    enable = true;
    shellAliases = shellAliases;
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.nix-your-shell.enable
  programs.nix-your-shell = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    nix-output-monitor.enable = true;
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.starship.enable
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    settings = builtins.fromTOML (builtins.readFile ./configs/starship/starship.toml);
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.zsh.enable
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    history.ignoreAllDups = true;
    sessionVariables = sessionVariables;
    shellAliases = shellAliases;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "af-magic";
    };
    initContent = shellExtras { shell = "zsh"; };
  };
}
