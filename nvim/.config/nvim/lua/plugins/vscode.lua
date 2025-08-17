return {
    {
        "Mofiqul/vscode.nvim",
        priority = 1000,
        config = function()
            require("vscode").setup({
                style = "dark",
                transparent = true,
                italic_comments = false,
                italic_inlayhints = true,
                underline_links = false,
                disable_nvimtree_bg = true,
                terminal_colors = false,
                -- Override colors (see ./lua/vscode/colors.lua)
                color_overrides = {
                    -- vscLineNumber = "#FFFFFF",
                    -- TSFunctionCall = "#FFFFFF",
                    -- vscYellow = "#FFFFFF",
                    vscYellow = "#cfcfb5",
                    vscBlue = "#8392da",
                },
                -- Override highlight groups (see ./lua/vscode/theme.lua)
                group_overrides = {
                    -- this supports the same val table as vim.api.nvim_set_hl
                    -- use colors from this colorscheme by requiring vscode.colors!
                    -- Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
                    -- ["@function.call"] = { link = "TSFunctionCall" },
                },
            })

            vim.cmd.colorscheme("vscode")

            local colors = require("config.colors")
            -- vim.api.nvim_set_hl(0, "@function", { fg = "#348989" })
            -- vim.api.nvim_set_hl(0, "@function.method", { fg = "#348989" })

            -- setting normal bg to none make nvim pick bg from terminal
            -- vim.api.nvim_set_hl(0, "Normal", { bg = "#1e1e1e" })
            vim.api.nvim_set_hl(0, "Normal", { bg = colors.background })

            -- Affects all floating window
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = colors.background })
            vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { fg = "#545454" })

            -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#262626" })
            -- vim.api.nvim_set_hl(0, 'FloatBorder', { fg='#9a8d7a', bg = "#262626" })
            vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#545454" })
        end,
    },
}
