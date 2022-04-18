-- >>> Basic
vim.o.relativenumber = true
vim.o.fillchars='eob: '
vim.cmd[[filetype plugin indent on]]
vim.cmd[[set autoindent]]
vim.cmd[[set tabstop=2]]
vim.cmd[[set shiftwidth=0]]
vim.g.mapleader = " "
-- automatically reload file when it is changed outside of neovim
vim.cmd[[set autoread]]
vim.cmd[[autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif]]
vim.cmd[[autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None]]
-- diagnostic
vim.cmd[[set signcolumn=number]] -- show signs on line number
-- terminal
vim.cmd[[set termguicolors]]
vim.cmd[[set fillchars-=vert:\| | set fillchars+=vert:\ ]]
-- <<< Basic

-- >>> Coloretheme 
local catppuccin = require("catppuccin")
catppuccin.setup()
vim.cmd[[colorscheme catppuccin]]

-- <<< Coloretheme 

-- <<< nvim-tree
require'nvim-tree'.setup {
	-- auto_close = true,
}
-- >>> nvim-tree


-- >>> nvim-treesitter
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevel = 99
require'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
		-- additional_vim_regex_highlighting = true,
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
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
  }
}
-- <<< nvim-treesitter


-- >>> lualine.nvim
require('lualine').setup()
-- <<< lualine.nvim


-- >>> lightspeed.nvim
require'lightspeed'.setup{}
-- <<< lightspeed.nvim


-- >>> toggleterm.nvim
require("toggleterm").setup{
	size = function(term)
		if term.direction == "horizontal" then
			return 10
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.5
		end
	end,
	-- direction = 'float',
	-- open_mapping = [[<c-\>]],
}
-- <<< toggleterm.nvim

-- >>> better-escape.nvim
require("better_escape").setup()
-- <<< better-escape.nvim

-- >>> FixCursorHold.nvim
vim.g.cursorhold_updatetime = 100
-- <<< FixCursorHold.nvim


-- >>> indent-blankline.nvim
vim.opt.termguicolors = true
vim.cmd[[highlight IndentBlanklineContextChar guifg=#9FD4FD gui=nocombine]]

vim.opt.list = true

require("indent_blankline").setup {
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
	filetype_exclude = {'NvimTree'},
}
-- <<< indent-blankline.nvim


-- >>> windwp/nvim-autopairs
require('nvim-autopairs').setup{}
-- <<< windwp/nvim-autopairs


-- >>> neoformat
vim.cmd("let g:neoformat_enabled_javascript = ['prettier']")
-- <<< neoformat

-- >>> coc.nvim: for LSP
-- <<< coc.nvim: for LSP

-- >>> nvim-comment
require("nvim_comment").setup({
  hook = function()
    require("ts_context_commentstring.internal").update_commentstring()
  end,
})
-- <<< nvim-comment
