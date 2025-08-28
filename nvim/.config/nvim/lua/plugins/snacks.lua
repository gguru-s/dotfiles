return {
    "folke/snacks.nvim",
    priority = 1000,
    enabled = true,
    lazy = false,
    config = function()
        -- local indentChar = "┊"
        local indentChar = "┆"
        -- local indentChar = "▏"

        require("snacks").setup({

            bigfile = { enabled = true },
            dashboard = { enabled = true },
            explorer = {
                enabled = true,
            },
            indent = {
                indent = {
                    priority = 1,
                    enabled = true,
                    char = indentChar,
                    only_scope = false,
                    hl = {
                        -- "Hidden",
                        "SnacksIndent",
                        "SnacksIndent",
                        "SnacksIndent",
                        "SnacksIndent",
                        "SnacksIndent",
                        "SnacksIndent",
                        "SnacksIndent",
                        "SnacksIndent",
                    },
                },
                scope = {
                    enabled = true, -- enable highlighting the current scope
                    priority = 200,
                    char = indentChar,
                    underline = false, -- underline the start of the scope
                    only_current = false, -- only show scope in the current window
                    hl = {
                        -- "Hidden",
                        "SnacksIndentScope",
                        "SnacksIndentScope",
                        "SnacksIndentScope",
                        "SnacksIndentScope",
                        "SnacksIndentScope",
                        "SnacksIndentScope",
                        "SnacksIndentScope",
                        "SnacksIndentScope",
                    },
                },
            },
            input = { enabled = true },
            notifier = {
                enabled = true,
                timeout = 3000,
            },
            picker = {
                enabled = true,

                -- removes the explorer tree indent lines
                icons = {
                    tree = {
                        vertical = "  ",
                        middle = "  ",
                        last = "  ",
                    },
                },

                layouts = {
                    default = {
                        layout = {
                            backdrop = false,
                        },
                    },
                },

                sources = {
                    explorer = {
                        auto_close = true,
                        hidden = true,
                        follow_file = true,
                        indent = {
                            enable = false,
                        },
                        git_status = false,
                        layout = {
                            layout = {
                                position = "left",
                                row = 2,
                                box = "vertical",
                                width = 0.2,
                                {
                                    win = "input",
                                    height = 1,
                                    border = "rounded",
                                },
                                {
                                    win = "list",
                                },
                            },
                        },
                        -- layout = {
                        --     layout = {
                        --         backdrop = false,
                        --         position = "float",
                        --         row = 2,
                        --         box = "vertical",
                        --         width = 0.4,
                        --         min_width = 50,
                        --         height = 0.5,
                        --         min_height = 30,
                        --         {
                        --             win = "input",
                        --             height = 1,
                        --             border = "hpad",
                        --         },
                        --         {
                        --             win = "list",
                        --             border = "rounded",
                        --         },
                        --     },
                        -- },
                    },
                    files = {
                        hidden = true,
                        ignored = false,
                        exclude = {
                            ".git",
                            ".cache",
                            "build",
                        },
                        -- layout = {
                        --     preset = "default",
                        --     layout = {
                        --         border = "none",
                        --     },
                        -- },
                        layout = {
                            layout = {
                                backdrop = false,
                                row = 2,
                                box = "vertical",
                                width = 0.4,
                                min_width = 50,
                                height = 0.5,
                                min_height = 30,
                                {
                                    win = "input",
                                    height = 1,
                                    border = "hpad",
                                },
                                { win = "list", border = "rounded" },
                            },
                        },
                    },
                    smart = {
                        hidden = true,
                        ignored = false,
                        exclude = {
                            ".git",
                            ".cache",
                            "build",
                        },
                        layout = {
                            layout = {
                                backdrop = false,
                                row = 2,
                                box = "vertical",
                                width = 0.4,
                                min_width = 50,
                                height = 0.5,
                                min_height = 30,
                                {
                                    win = "input",
                                    height = 1,
                                    border = "hpad",
                                },
                                { win = "list", border = "rounded" },
                            },
                        },
                    },
                },
            },
            quickfile = { enabled = true },
            scope = { enabled = true },
            scroll = { enabled = false },
            statuscolumn = { enabled = true },
            words = { enabled = true },
            styles = {
                notification = {
                    wo = { wrap = true }, -- Wrap notifications
                },
                input = {
                    position = "float",
                    relative = "cursor",
                    b = {
                        completion = true,
                    },
                },
            },
        })
    end,

    keys = require("config.snacks-keys"),

    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
                -- Setup some globals for debugging (lazy-loaded)
                _G.dd = function(...)
                    Snacks.debug.inspect(...)
                end
                _G.bt = function()
                    Snacks.debug.backtrace()
                end
                vim.print = _G.dd -- Override print to use snacks for `:=` command

                -- Create some toggle mappings
                Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
                Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
                Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
                Snacks.toggle.diagnostics():map("<leader>ud")
                Snacks.toggle.line_number():map("<leader>ul")
                Snacks.toggle
                    .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
                    :map("<leader>uc")
                Snacks.toggle.treesitter():map("<leader>uT")
                -- Snacks.toggle
                --     .option("background", { off = "light", on = "dark", name = "Dark Background" })
                --     :map("<leader>ub")
                Snacks.toggle.inlay_hints():map("<leader>ih")
                Snacks.toggle.indent():map("<leader>ug")
                Snacks.toggle.dim():map("<leader>uD")
            end,
        })
    end,
}
