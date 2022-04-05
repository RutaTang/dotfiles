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

-- >>> nvim-lspconfig
vim.diagnostic.config({
	virtual_text = false, -- disable diagnostic as virtual text
	-- signs = false, -- disable left side signs
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
	-- for commentstring with jsx
	context_commentstring = {
    enable = true,
		config = {
      javascript = {
        __default = '// %s',
        jsx_element = '{/* %s */}',
        jsx_fragment = '{/* %s */}',
        jsx_attribute = '// %s',
        comment = '// %s'
      },
    },
  },
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
			return 15
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

-- >>> symbols-outline.nvim
vim.g.symbols_outline = {
	auto_preview = false,
	width = 20,
	highlight_hovered_item = false,
	preview_bg_highlight = "Pmenu",
}
-- >>>

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

-- >>> comment
require('Comment').setup{
	pre_hook = function(ctx)
        -- Only calculate commentstring for jsx and tsx filetypes
        if vim.bo.filetype == 'javascriptreact' or vim.bo.filetype == 'typescriptreact' then
            local U = require('Comment.utils')

            -- Detemine whether to use linewise or blockwise commentstring
            local type = ctx.ctype == U.ctype.line and '__default' or '__multiline'

            -- Determine the location where to calculate commentstring from
            local location = nil
            if ctx.ctype == U.ctype.block then
                location = require('ts_context_commentstring.utils').get_cursor_location()
            elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                location = require('ts_context_commentstring.utils').get_visual_start_location()
            end

            return require('ts_context_commentstring.internal').calculate_commentstring({
                key = type,
                location = location,
            })
        end
    end,
}
-- <<< comment


-- >>> neoformat
vim.cmd("let g:neoformat_enabled_javascript = ['prettier']")
-- <<< neoformat

