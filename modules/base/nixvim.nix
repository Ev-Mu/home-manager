{
  programs.nixvim = {
    enable = true;

    # Core editor behavior
    opts = {
      number = true;
      relativenumber = true;
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
    };

    # UI
    plugins.lualine.enable = true;
    plugins.which-key.enable = true;

    # Navigation
    plugins.telescope.enable = true;
    plugins.neo-tree.enable = true;

    # Editing
    plugins.comment.enable = true;
    plugins.nvim-autopairs.enable = true;
    plugins.nvim-surround.enable = true;

    # Git
    plugins.gitsigns.enable = true;

    # Syntax
    plugins.treesitter.enable = true;

    # LSP
    plugins.lsp.enable = true;

    # Completion
    plugins.cmp.enable = true;

    # Formatting
    plugins.conform-nvim.enable = true;
  };
}
