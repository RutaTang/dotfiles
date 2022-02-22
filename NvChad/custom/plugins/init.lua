return {
  -- lsp server installer
  {"williamboman/nvim-lsp-installer"},
  -- surrond editing
  {"tpope/vim-surround"},
  -- AI Coding
  {"github/copilot.vim"},
  -- Markdown previewer in neovim
  {"ellisonleao/glow.nvim"},
  -- text aligner
  {"godlygeek/tabular"},
  -- markdown syntax highlighting and folding
  {"preservim/vim-markdown"},
  -- web browser support as frontend of nvim
  {"glacambre/firenvim",
    run = function() vim.fn['firenvim#install'](0) end
  },
  -- CheatSheet
  {"sudormrfbin/cheatsheet.nvim"},
  -- Emmet support
  {"mattn/emmet-vim"},
}
