return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        "onsails/lspkind.nvim",
    },
    config = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")
        local luasnip = require("luasnip")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        require("luasnip.loaders.from_vscode").lazy_load()

        -- vim.opt.completeopt = { "menu", "menuone", "noselect" }
        vim.opt.completeopt = { "menu", "menuone", "noinsert" }
        luasnip.config.setup({})

        cmp.setup({
            preselect = true,
            completion = {
                completeopt = "menu, menuone, noinsert",
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            window = {
                completion = {
                    border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
                    winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
                },
                documentation = {
                    border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
                    winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
                },
            },
            -- mapping = cmp.mapping.preset.insert({
            --     ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
            --     ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
            --     ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            --     ["<C-f>"] = cmp.mapping.scroll_docs(4),
            --     ["<C-l>"] = cmp.mapping.confirm({ select = true }),
            --     ["<C-Space>"] = cmp.mapping.complete(),
            --     ["<C-e>"] = cmp.mapping.abort(),
            -- }),
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "nvim_lsp_signature_help" },
                { name = "luasnip" },
                -- { name = 'nvim_lua' },
                { name = "buffer" },
                { name = "path" },
            }),
            experimental = {
                -- ghost_text = true,
            },
            formatting = {
                format = lspkind.cmp_format({
                    maxwidth = 50,
                    ellipsis_char = "...",
                }),
            },
        })

        -- `/` cmdline setup.
        cmp.setup.cmdline("/", {
            -- mapping = cmp.mapping.preset.cmdline(),
            mapping = cmp.mapping.preset.cmdline({
                ["<CR>"] = {
                    c = function(default)
                        if cmp.visible() then
                            return cmp.confirm({ select = true })
                        end
                        default()
                    end,
                },
            }),
            sources = {
                { name = "buffer" },
            },
        })

        -- `:` cmdline setup.
        cmp.setup.cmdline(":", {
            -- mapping = cmp.mapping.preset.cmdline(),
            mapping = cmp.mapping.preset.cmdline({
                ["<CR>"] = {
                    c = function(default)
                        if cmp.visible() then
                            return cmp.confirm({ select = true })
                        end
                        default()
                    end,
                },
            }),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
            -- matching = { disallow_symbol_nonprefix_matching = false },
        })
    end,
}
