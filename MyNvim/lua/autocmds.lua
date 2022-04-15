-- >>> nvim-tree
-- open nivm tree automatically
vim.cmd[[au VimEnter * NvimTreeToggle]]
-- <<< nvim-tree


--- >>> coc.nvim
vim.cmd[[au VimEnter,Tabnew * if !empty(&buftype) | call CocActionAsync('showOutline',1) | endif ]]
--- <<< coc.nvim


