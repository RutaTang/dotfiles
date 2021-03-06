-- >>> autocmds
-- auto open neo-tree.nvim on startup
vim.cmd [[
    augroup NEOTREE_AUGROUP
      autocmd!
      au VimEnter * lua vim.defer_fn(function() vim.cmd("Neotree show left") end, 10)
    augroup END
]]
-- <<< autocmds

-- >>> AstroNvim Config
local config = {
    -- Set colorscheme
    colorscheme = "default_theme",
    -- set vim options here (vim.<first_key>.<second_key> =  value)
    options = {
        opt = {
            relativenumber = true -- sets vim.opt.relativenumber
        },
        g = {
            mapleader = " ", -- sets vim.g.mapleader
            vimtex_view_method = "skim",
            vimtex_quickfix_open_on_warning = 0,
            copilot_no_tab = true, -- not use tab
            copilot_assume_mapped = true, --  customize copilot accpect
        },
        o = {
            foldmethod = "indent",
            foldlevelstart = 99
        }
    },
    -- Default theme configuration
    default_theme = {
        diagnostics_style = {italic = true},
        -- Modify the color table
        colors = {
            fg = "#abb2bf"
        },
        -- Modify the highlight groups
        highlights = function(highlights)
            local C = require "default_theme.colors"

            highlights.Normal = {fg = C.fg, bg = C.bg}
            return highlights
        end
    },
    -- Disable AstroNvim ui features
    ui = {
        nui_input = true,
        telescope_select = true
    },
    -- Configure plugins
    plugins = {
        -- Add plugins, the packer syntax without the "use"
        init = {
            -- You can disable default plugins as follows:
            -- ["goolord/alpha-nvim"] = { disable = true },

            -- You can also add new plugins here as well:
            -- { "andweeb/presence.nvim" },
            -- {
            --   "ray-x/lsp_signature.nvim",
            --   event = "BufRead",
            --   config = function()
            --     require("lsp_signature").setup()
            --   end,
            -- },

            -- fast cursor move
            {"ggandor/lightspeed.nvim"},
            -- format
            {"sbdchd/neoformat"},
            -- emmet
            {"mattn/emmet-vim"},
            -- numb.nvim: preview line quckly
            {
                "nacro90/numb.nvim",
                config = function()
                    require("numb").setup()
                end
            },
            -- latex
            {
                "lervag/vimtex"
            },
            -- copilot: AI code helper
            {
                "github/copilot.vim",
            }
        },
        -- All other entries override the setup() call for default plugins
        treesitter = {
            ensure_installed = {"lua"},
            indent = {
                enable = true
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<CR>",
                    node_incremental = "<CR>",
                    node_decremental = "<BS>",
                    scope_incremental = "<TAB>"
                }
            }
        },
        ["nvim-lsp-installer"] = {
            ensure_installed = {"sumneko_lua"}
        },
        packer = {
            compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua"
        },
        ["neo-tree"] = {
            window = {
                width = 28
            }
        },
        cmp = function(opts)
            local cmp = require "cmp"
            -- disable using tab to navigative luasnip
            opts.mapping["<Tab>"] =
                cmp.mapping(
                function(fallback)
                    fallback()
                end,
                {
                    "i",
                    "s"
                }
            )
            opts.mapping["<S-Tab>"] =
                cmp.mapping(
                function(fallback)
                    fallback()
                end,
                {"i", "s"}
            )
            opts.mapping["<CR>"] = cmp.mapping.confirm {select = false}
            return opts
        end
    },
    -- LuaSnip Options
    luasnip = {
        -- Add paths for including more VS Code style snippets in luasnip
        vscode_snippet_paths = {},
        -- Extend filetypes
        filetype_extend = {
            javascript = {"javascriptreact"}
        }
    },
    -- Modify which-key registration
    ["which-key"] = {
        -- Add bindings
        register_mappings = {
            -- first key is the mode, n == normal mode
            n = {
                -- second key is the prefix, <leader> prefixes
                ["<leader>"] = {
                    -- which-key registration table for normal mode, leader prefix
                    -- ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
                    ["a"] = {
                        ["c"] = {":BufferLineCloseLeft<CR>:BufferLineCloseRight<CR>", "Close All Other"},
                        ["s"] = {":wa<CR>", "Save All"}
                    },
                    ["s"] = {":w<CR>", "Save Current"}
                },
                ["<ESC>"] = {":nohl<CR>", "Clear Highlight"},
                ["="] = {
                    ["G"] = {":Neoformat<CR>", "Format"},
                    ["gg"] = {":Neoformat<CR>", "Format"}
                }
            },
            i = {
                ["<C-i>"] = {[[copilot#Accept("<CR>")]], "Accpet AI assistant",silent=true,expr=true},
                ["<C-]>"] = {[[<Plug>(copilot-next)]], "Next AI assistant",silent=true},
                ["<C-[>"] = {[[<Plug>(copilot-previous)]], "Previous AI assistant",silent=true}
            }
        }
    },
    -- CMP Source Priorities
    -- modify here the priorities of default cmp sources
    -- higher value == higher priority
    -- The value can also be set to a boolean for disabling default sources:
    -- false == disabled
    -- true == 1000
    cmp = {
        source_priority = {
            nvim_lsp = 1000,
            luasnip = 750,
            buffer = 500,
            path = 250
        }
    },
    -- Extend LSP configuration
    lsp = {
        -- enable servers that you already have installed without lsp-installer
        servers = {},
        -- add to the server on_attach function
        -- on_attach = function(client, bufnr)
        -- end,

        -- override the lsp installer server-registration function
        -- server_registration = function(server, opts)
        --   require("lspconfig")[server.name].setup(opts)
        -- end

        -- Add overrides for LSP server settings, the keys are the name of the server
        ["server-settings"] = {}
    },
    -- Diagnostics configuration (for vim.diagnostics.config({}))
    diagnostics = {
        virtual_text = true,
        underline = true
    },
    -- null-ls configuration
    ["null-ls"] = function()
        -- Formatting and linting
        -- https://github.com/jose-elias-alvarez/null-ls.nvim
        local status_ok, null_ls = pcall(require, "null-ls")
        if not status_ok then
            return
        end

        -- Check supported formatters
        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
        local formatting = null_ls.builtins.formatting

        -- Check supported linters
        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
        local diagnostics = null_ls.builtins.diagnostics

        null_ls.setup {
            debug = false,
            sources = {
                -- Set a formatter
                formatting.rufo,
                -- Set a linter
                diagnostics.rubocop
            },
            -- NOTE: You can remove this on attach function to disable format on save
            on_attach = function(client)
                if client.resolved_capabilities.document_formatting then
                    vim.api.nvim_create_autocmd(
                        "BufWritePre",
                        {
                            desc = "Auto format before save",
                            pattern = "<buffer>",
                            callback = vim.lsp.buf.formatting_sync
                        }
                    )
                end
            end
        }
    end,
    -- This function is run last
    -- good place to configure mappings and vim options
    polish = function()
        -- Set key bindings
        vim.keymap.set("n", "<C-s>", ":w!<CR>")

        -- Set autocommands
        vim.api.nvim_create_augroup("packer_conf", {clear = true})
        vim.api.nvim_create_autocmd(
            "BufWritePost",
            {
                desc = "Sync packer after modifying plugins.lua",
                group = "packer_conf",
                pattern = "plugins.lua",
                command = "source <afile> | PackerSync"
            }
        )

        -- Set up custom filetypes
        -- vim.filetype.add {
        --   extension = {
        --     foo = "fooscript",
        --   },
        --   filename = {
        --     ["Foofile"] = "fooscript",
        --   },
        --   pattern = {
        --     ["~/%.config/foo/.*"] = "fooscript",
        --   },
        -- }
    end
}

return config
-- <<< AstroNvim Config
