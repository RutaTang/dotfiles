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

--- >>> nvim-lspconfig (some kepmapping is in lsp folder)
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
M.on_attach = function(client, bufnr)
	local opts = { noremap=true, silent=true }
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end
--- <<< nvim-lspconfig

-- >>> nvim-cmp: auto completion
local cmp = require'cmp'
cmp.setup({
	mapping = {
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	},
})
-- <<< nvim-cmp: auto completion


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


-- >>> symbols-outline.nvim
vim.api.nvim_set_keymap('n', '<leader>o', ':SymbolsOutline<CR>', {noremap = true, silent = true})
-- <<< symbols-outline.nvim

return M
