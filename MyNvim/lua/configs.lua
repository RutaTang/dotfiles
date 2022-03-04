-- >>> Basic
vim.o.relativenumber = true
vim.o.fillchars='eob: '
vim.cmd[[filetype plugin indent on]]
vim.cmd[[set autoindent]]
vim.cmd[[set tabstop=4]]
vim.cmd[[set shiftwidth=0]]
vim.g.mapleader = " "
-- <<< Basic

-- >>> Coloretheme 
local catppuccin = require("catppuccin")
catppuccin.setup()
vim.cmd[[colorscheme catppuccin]]
-- <<< Coloretheme 

-- >>> nvim-lspconfig
vim.diagnostic.config({
	virtual_text = false, -- disable diagnostic as virtual text
	signs = false, -- disable left side signs
	float = {border = "single"} -- show border when float popups
})
-- show border box with hover
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})
-- <<< nvim-lspconfig

-- >>> nvim-cmp
-- Setup nvim-cmp.
local cmp = require'cmp'
cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }, -- For luasnip users.
		}, {
			{ name = 'buffer' },
	})
})
-- <<< nvim-cmp

-- <<< nvim-tree
require'nvim-tree'.setup {
	auto_close = true
}
-- >>> nvim-tree


-- >>> nvim-treesitter
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevel = 99
require'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = '<CR>',
			node_incremental = '<CR>',
			node_decremental = '<BS>',
			scope_incremental = '<TAB>',
		}
	},
	indent = {
		enable = true
	}
}
-- <<< nvim-treesitter


-- >>> barbar.nvim: tabs
-- <<< barbar.nvim
