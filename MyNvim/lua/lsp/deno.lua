local M = {}
M.name = "denols"
M.setup = {
	root_dir = require("lspconfig").util.root_pattern("deno.json"),
}
return M
