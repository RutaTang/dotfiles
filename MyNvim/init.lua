require('plugins')
require('configs')
require('keymappings')
require('lsp')

local catppuccin = require("catppuccin")

-- configure it
catppuccin.setup()
vim.cmd[[colorscheme catppuccin]]

