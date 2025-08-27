return {
    {
        "Mofiqul/vscode.nvim",
        priority = 1000,
        config = function()
            require("vscode").setup({
                style = "dark",
                transparent = true,
                italic_comments = true,
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

            vim.api.nvim_set_hl(0, "Normal", { bg = colors.background })

            -- Used to hide the fist level indent guide line,
            -- this merges the line with the background
            -- TODO: when the cursor is on the hidden indent line, the character fg color should be the color of the cursor
            vim.api.nvim_set_hl(0, "Hidden", { fg = colors.background, bg = colors.background })

            -- Affects all floating window
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = colors.background })
            vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { fg = colors.border })

            vim.api.nvim_set_hl(0, "FloatBorder", { fg = colors.border })

            vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#53555a" })
            vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#26393d" })
            vim.api.nvim_set_hl(0, "SnacksPickerBorder", { fg = colors.border })
            vim.api.nvim_set_hl(0, "SnacksInputBorder", { fg = colors.border })

            vim.api.nvim_set_hl(0, "TabLineFill", { bg = "#1F1F1F" })
            vim.api.nvim_set_hl(0, "TabLine", { bg = "#1F1F1F" })
            -- vim.api.nvim_set_hl(0, "TabLineSel", { bg = "#2D2D2D" })
            -- vim.api.nvim_set_hl(0, "TabLineSel", { bg = "#303030" })
            vim.api.nvim_set_hl(0, "TabLineSel", { bg = "#3c3c3d" })
            -- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2a2a2a" })
        end,
    },
}
