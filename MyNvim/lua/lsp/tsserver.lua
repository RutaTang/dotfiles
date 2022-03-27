local M = {}
M.name = "tsserver"
M.setup = {
	root_dir = require("lspconfig").util.root_pattern("tsconfig.json","jsconfig.json","package.json"),
}
return M
