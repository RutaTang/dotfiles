-- MAPPINGS
local map = require("core.utils").map

map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<leader>q", ":q <CR>")

-- Copilot Mapping
vim.api.nvim_set_keymap('i','<C-j>','copilot#Accept("<CR>")',{expr=true,silent=true})
vim.g.copilot_no_tab_map = true

-- ===Bufferline Mapping===
-- Close others
vim.api.nvim_set_keymap('n','<leader>bo',':BufferLineCloseLeft<CR> :BufferLineCloseRight<CR>',{noremap=true, silent=true})
-- Pick buffer
vim.api.nvim_set_keymap('n','<leader>bp',':BufferLinePick<CR>',{noremap=true, silent=true})
-- Pick buffer Close
vim.api.nvim_set_keymap('n','<leader>bc',':BufferLinePickClose<CR>',{noremap=true, silent=true})
-- Move bufer to prev 
vim.api.nvim_set_keymap('n','<leader>bh',':BufferLineMovePrev<CR>',{noremap=true, silent=true})
-- Move bufer to next 
vim.api.nvim_set_keymap('n','<leader>bl',':BufferLineMoveNext<CR>',{noremap=true, silent=true})

