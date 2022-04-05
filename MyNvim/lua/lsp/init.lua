local keymappings = require('keymappings')
-- Get setup config
-- automatcally require all files inside lsp except init.lua
-- and put these required into lsps
local paths = vim.split(vim.fn.glob('~/.config/nvim/lua/lsp/*.lua'),'\n')
local lsps = {}
for _,path in pairs(paths) do
	local lsp_arr = vim.split(path,'/')
	local lsp_name_with_extension = lsp_arr[#lsp_arr]
	local lsp_name = lsp_name_with_extension:match("(.+)%..+")
	if (lsp_name ~= "init") then
		local lsp_model_path = "lsp/" .. lsp_name
		local lsp = require(lsp_model_path)
		table.insert(lsps,lsp)
	end
end

-- Add Common setup Configs
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local common_setups = function(setup)
	setup.capabilities = capabilities
	setup.on_attach = keymappings.on_attach
end

-- Make it works
for _,v in pairs(lsps) do
	common_setups(v.setup)
	require('lspconfig')[v.name].setup(v.setup)
end

