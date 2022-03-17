return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	-- Nvim tree
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
		},
		config = function() require'nvim-tree'.setup {} end
	}
	-- Colortheme
	use {
		"catppuccin/nvim",
		as = "catppuccin"
	}
	-- LSP
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	-- tree sitter
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	-- telescop: fuzy searrcg
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	-- tab
	use {
		'romgrk/barbar.nvim',
		requires = {'kyazdani42/nvim-web-devicons'}
	}
	-- surround editing
	use 'tpope/vim-surround'
	-- copilot
	use 'github/copilot.vim'
	-- emmet
	use 'mattn/emmet-vim'
	-- statusline: lualine.nvim
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	-- fast motion: lightspeed.nvim
	use 'ggandor/lightspeed.nvim'
	-- terminal: toggleterm.nvim
	use {"akinsho/toggleterm.nvim"}
	-- escape: better-escape.nvim
	use { "max397574/better-escape.nvim" }
	-- neoformt
	use 'sbdchd/neoformat'
	-- code outline: symbols-outline.nvim
	use 'simrat39/symbols-outline.nvim'
	--  FixCursorHold.nvim: Fix CursorHold Performance
  use 'antoinemadec/FixCursorHold.nvim'
	-- indent line
	use { "lukas-reineke/indent-blankline.nvim"}
	-- auto pair
	use 'windwp/nvim-autopairs'
end)

