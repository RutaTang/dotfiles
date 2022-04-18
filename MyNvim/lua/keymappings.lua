local M = {}
-- helper functions
local keymap = function(mode,options)
	return function(lhs,rhs)
		vim.api.nvim_set_keymap(mode,lhs,rhs,options)
	end
end

local keymap_nnoremap_silent = keymap('n',{noremap=true,silent=true})



-- >>> basic
-- Window Navivation
keymap_nnoremap_silent('<C-h>','<C-w>h')
keymap_nnoremap_silent('<C-j>','<C-w>j')
keymap_nnoremap_silent('<C-k>','<C-w>k')
keymap_nnoremap_silent('<C-l>','<C-w>l')
-- Window Sizing
keymap_nnoremap_silent('-','<C-w>-')
keymap_nnoremap_silent('+','<C-w>+')
-- Window Splitting
keymap_nnoremap_silent('<leader>hs',':split<CR>')
keymap_nnoremap_silent('<leader>vs',':vsplit<CR>')
-- no highligh after searching
keymap_nnoremap_silent('<ESC>',':nohl<CR>')
-- save file
vim.api.nvim_set_keymap('n','<leader>s',':w<CR>',{noremap=true,silent=true})
vim.api.nvim_set_keymap('n','<leader>as',':wa<CR>',{noremap=true,silent=true})
-- <<< basic

-- >>> nvim-tree
keymap_nnoremap_silent('<C-n>',':NvimTreeToggle<CR>')
keymap_nnoremap_silent('R',':NvimTreeRefresh<CR>')
-- <<< nvim-tree


-- >>> telescope
vim.api.nvim_set_keymap('n','<leader>ff','<cmd>lua require("telescope.builtin").find_files()<cr>',{noremap=true,silent=true})
vim.api.nvim_set_keymap('n','<leader>fg','<cmd>lua require("telescope.builtin").live_grep()<cr>',{noremap=true,silent=true})
vim.api.nvim_set_keymap('n','<leader>fb','<cmd>lua require("telescope.builtin").buffers()<cr>',{noremap=true,silent=true})
vim.api.nvim_set_keymap('n','<leader>fh','<cmd>lua require("telescope.builtin").help_tags()<cr>',{noremap=true,silent=true})
-- <<< telescope


-- >>> barbar.nvim 
local barbar_map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- Move to previous/next
barbar_map('n', '<leader>,', ':BufferPrevious<CR>', opts)
barbar_map('n', '<leader>.', ':BufferNext<CR>', opts)
-- Re-order to previous/next
barbar_map('n', '<leader><', ':BufferMovePrevious<CR>', opts)
barbar_map('n', '<leader>>', ' :BufferMoveNext<CR>', opts)
-- Goto buffer in position...
barbar_map('n', '<leader>1', ':BufferGoto 1<CR>', opts)
barbar_map('n', '<leader>2', ':BufferGoto 2<CR>', opts)
barbar_map('n', '<leader>3', ':BufferGoto 3<CR>', opts)
barbar_map('n', '<leader>4', ':BufferGoto 4<CR>', opts)
barbar_map('n', '<leader>5', ':BufferGoto 5<CR>', opts)
barbar_map('n', '<leader>6', ':BufferGoto 6<CR>', opts)
barbar_map('n', '<leader>7', ':BufferGoto 7<CR>', opts)
barbar_map('n', '<leader>8', ':BufferGoto 8<CR>', opts)
barbar_map('n', '<leader>9', ':BufferGoto 9<CR>', opts)
barbar_map('n', '<leader>0', ':BufferLast<CR>', opts)
-- Close buffer
barbar_map('n', '<leader>x', ':BufferClose<CR>', opts)
barbar_map('n', '<C-p>', ':BufferPick<CR>', opts)
-- Close commands
barbar_map('n', '<leader>ax',':BufferCloseAllButCurrent<CR>',opts)
-- Sort automatically by...
barbar_map('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>', opts)
barbar_map('n', '<Space>bd', ':BufferOrderByDirectory<CR>', opts)
barbar_map('n', '<Space>bl', ':BufferOrderByLanguage<CR>', opts)
-- <<< barbar.nvim

-- >>> terminal: toggleterm.nvim
function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end
-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
vim.api.nvim_set_keymap('n', '<leader>t', ':ToggleTerm size=10 direction=horizontal<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>at', ':ToggleTermToggleAll<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', '<leader>t', ':ToggleTermSendVisualLine<CR>', {noremap = true, silent = true})
-- <<< terminal: toggleterm.nvim

-- >>> Neoformat
vim.api.nvim_set_keymap('n', '=gg', ':Neoformat<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '=G', ':Neoformat<CR>', {noremap = true, silent = true})
-- <<< NeoFormat

-- >>> coc.nvim: for LSP
vim.api.nvim_set_keymap('n', '<leader>o', ":call CocAction('showOutline')<CR>", {noremap = true, silent = true})
-- use <CR> to chose completion
vim.api.nvim_set_keymap('i', '<CR>', [[ pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], {noremap=true, expr= true, silent = true})
-- code navigation
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)' , {silent = true})
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)' , {silent = true})
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)' , {silent = true})
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)' , {silent = true})
-- show documentation in preview window
function coc_show_document()
	vim.api.nvim_exec([[
	if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
	]], true)
end
vim.api.nvim_set_keymap('n', 'K', ':lua coc_show_document()<CR>', {noremap = true, silent = true})
-- symbol renaming
vim.api.nvim_set_keymap('n', '<leader>rn', '<Plug>(coc-rename)',{})
-- code action
vim.api.nvim_set_keymap('n', '<leader>ca', '<Plug>(coc-codeaction)',{silent=true})
vim.api.nvim_set_keymap('x', '<leader>ca', '<Plug>(coc-codeaction-selected)',{silent=true})
-- quick fix
vim.api.nvim_set_keymap('n', '<leader>qf', '<Plug>(coc-fix-current)',{})
-- <<< coc.nvim: for LSP

-- >>> move.nvim
-- the weird symbols may depend on your OS, triangle here is like <A-j>
vim.api.nvim_set_keymap('n', '∆', ":MoveLine(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '˚', ":MoveLine(-1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '∆', ":MoveBlock(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '˚', ":MoveBlock(-1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '¬', ":MoveHChar(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '˙', ":MoveHChar(-1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '¬', ":MoveHBlock(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '˙', ":MoveHBlock(-1)<CR>", { noremap = true, silent = true })
-- <<< move.nvim

return M
