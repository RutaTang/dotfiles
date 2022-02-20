-- Just an example, supposed to be placed in /lua/custom/

local M = {}


local userPlugins = require "custom.plugins" -- path to table
local pluginConfs = require "custom.plugins.configs" 

M.plugins = {
  options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },
   default_plugin_config_replace = {
     nvim_tree = pluginConfs.nvimtree,
   },
   install = userPlugins
}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "gruvchad",
}

return M
