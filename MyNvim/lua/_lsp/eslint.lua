local M = {}
M.name = "eslint"
M.setup = {
	root_dir = require("lspconfig").util.root_pattern(".eslintrc.js",".eslintrc.json"),
}
return M
