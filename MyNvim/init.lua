require('plugins')
require('configs')
require('keymappings')
require('lsp')
require('autocmds')

local catppuccin = require("catppuccin")

-- configure it
catppuccin.setup()
vim.cmd[[colorscheme catppuccin]]

