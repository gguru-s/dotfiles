return {
    "saghen/blink.cmp",
    event = "VimEnter",
    enabled = false,
    version = "1.*",
    dependencies = {
        {
            "L3MON4D3/LuaSnip",
            version = "2.*",
            build = (function()
                if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
                    return
                end
                return "make install_jsregexp"
            end)(),
            dependencies = {},
            opts = {},
        },
        "folke/lazydev.nvim",
    },
    config = function()
        local blink = require("blink.cmp")
        local border = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
        blink.setup({
            keymap = {
                preset = "default",
                ["<C-k>"] = { "select_prev", "fallback" },
                ["<C-j>"] = { "select_next", "fallback" },
                ["<C-l>"] = { "select_and_accept" },
            },

            completion = {
                menu = {
                    border = "single",
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 500,
                    window = {
                        border = "single",
                        -- border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
                    },
                },
            },

            sources = {
                default = { "lsp", "path", "snippets", "lazydev" },
                providers = {
                    lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
                    path = {
                        opts = {
                            get_cwd = function(_)
                                return vim.fn.getcwd()
                            end,
                        },
                    },
                },
            },

            snippets = { preset = "luasnip" },
            fuzzy = { implementation = "lua" },
            signature = {
                enabled = true,
                window = {
                    border = "single",
                },
            },
            cmdline = {
                keymap = { preset = "inherit" },
                completion = { menu = { auto_show = true } },
            },
        })
    end,
}
