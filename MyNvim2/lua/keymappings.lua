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
-- no highligh after searching
keymap_nnoremap_silent('<ESC>',':nohl<CR>')
-- save file
vim.api.nvim_set_keymap('n','<C-s>',':w<CR>',{noremap=true,silent=true})
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
end
-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- <<< terminal: toggleterm.nvim

-- >>> Neoformat
vim.api.nvim_set_keymap('n', '=gg', ':Neoformat<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '=G', ':Neoformat<CR>', {noremap = true, silent = true})
-- <<< NeoFormat


-- >>> symbols-outline.nvim
vim.api.nvim_set_keymap('n', '<leader>o', ':SymbolsOutline<CR>', {noremap = true, silent = true})
-- <<< symbols-outline.nvim

-- >>> coc.nvim
-- use enter to complete first hint
vim.api.nvim_set_keymap('i', '<CR>', [[pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], {noremap = true, silent = true, expr = true})
-- Use `[g` and `]g` to navigate diagnostics
vim.cmd[[nmap <silent> [g <Plug>(coc-diagnostic-prev)]]
vim.cmd[[nmap <silent> ]g <Plug>(coc-diagnostic-next)]]
-- GoTo code navigation.
vim.cmd[[nmap <silent> gd <Plug>(coc-definition)]]
vim.cmd[[nmap <silent> gy <Plug>(coc-type-definition)]]
vim.cmd[[nmap <silent> gi <Plug>(coc-implementation)]]
vim.cmd[[nmap <silent> gr <Plug>(coc-references)]]
-- Show document in preview window
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
-- Symbol renaming
vim.cmd[[nmap <leader>rn <Plug>(coc-rename)]]
-- code action
vim.cmd[[map <leader>ca  <Plug>(coc-codeaction)]]
vim.cmd[[xmap <leader>c  <Plug>(coc-codeaction-selected)]]
-- quick fix
vim.cmd[[nmap <leader>qf  <Plug>(coc-fix-current)]]
-- <<< coc.nvim

return M
