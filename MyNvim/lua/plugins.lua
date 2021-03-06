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
	-- escape: better-escape.nvim
	use { "max397574/better-escape.nvim" }
	-- neoformt
	use 'sbdchd/neoformat'
	--  FixCursorHold.nvim: Fix CursorHold Performance
  use 'antoinemadec/FixCursorHold.nvim'
	-- indent line
	use { "lukas-reineke/indent-blankline.nvim"}
	-- auto pair
	use 'windwp/nvim-autopairs'
	-- comment
	use 'JoosepAlviste/nvim-ts-context-commentstring'
	use 'terrortylor/nvim-comment'
	-- LSP
	use {'neoclide/coc.nvim', branch = 'release'}
	-- fold
	use{ 'anuvyklack/pretty-fold.nvim',
		config = function()
			require('pretty-fold').setup()
			require('pretty-fold.preview').setup()
		end
	}
	-- move line quickly
	use 'fedepujol/move.nvim'
	-- terminal
	use {"akinsho/toggleterm.nvim"}
	-- pick line: numb.nvim
	use 'nacro90/numb.nvim'
	-- show registers: registers.nvim
	use "tversteeg/registers.nvim"
end)

