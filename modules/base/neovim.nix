{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    # defaultEditor = true;
    # viAlias = true;
    # vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      # coc-nvim
      # coc-clangd
      # kanagawa-nvim
      # lualine-nvim
      # vim-nix
      # YankRing-vim
      # yazi-nvim
      LazyVim
    ];
  };
}
