-- MAPPINGS
local map = require("core.utils").map

map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<leader>q", ":q <CR>")

-- Copilot Mapping
vim.api.nvim_set_keymap('i','<C-j>','copilot#Accept("<CR>")',{expr=true,silent=true})
vim.g.copilot_no_tab_map = true

-- Bufferline Mapping
vim.api.nvim_set_keymap('n','<leader>o',':BufferLineCloseLeft<CR> :BufferLineCloseRight<CR>',{noremap=true, silent=true})

