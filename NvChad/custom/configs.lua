vim.opt.relativenumber = true

-- <<< nvim-treesitter
-- Indentation
require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  }
}
-- Folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- >>> nvim-treesitter


