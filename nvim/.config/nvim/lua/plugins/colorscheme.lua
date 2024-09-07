return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "auto", -- latte, frappe, macchiato, mocha
                background = { -- :h background
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = false, -- disables setting the background color.
                show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
                term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
                dim_inactive = {
                    enabled = false, -- dims the background color of inactive window
                    shade = "dark",
                    percentage = 0.15, -- percentage of the shade to apply to the inactive window
                },
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    treesitter = true,
                    notify = false,
                    mini = {
                        enabled = true,
                        indentscope_color = "",
                    },
                    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
                },
            })

            vim.cmd.colorscheme("catppuccin")

            -- setting normal bg to none make nvim pick bg from terminal
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

            -- Affects diagnostics floating window
            -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#262626" })
            -- vim.api.nvim_set_hl(0, 'FloatBorder', { fg='#9a8d7a', bg = "#262626" })
            vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#9a8d7a" })

            vim.diagnostic.config({
                float = { border = "single" },
            })

            -- set telescope window colors
            local colors = require("catppuccin.palettes").get_palette()
            local TelescopeColor = {
                TelescopeMatching = { fg = colors.flamingo },
                TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },

                TelescopePromptPrefix = { bg = "#262626" },
                TelescopePromptNormal = { bg = "#262626" },
                TelescopeResultsNormal = { bg = "#262626" },
                TelescopePreviewNormal = { bg = "#262626" },
                TelescopePromptBorder = { bg = "none", fg = "#9a8d7a" },
                TelescopeResultsBorder = { bg = "none", fg = "#9a8d7a" },
                TelescopePreviewBorder = { bg = "none", fg = "#9a8d7a" },
                TelescopePromptTitle = { bg = colors.pink, fg = colors.mantle },
                TelescopeResultsTitle = { bg = colors.pink, fg = colors.mantle },
                TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
            }

            for hl, col in pairs(TelescopeColor) do
                vim.api.nvim_set_hl(0, hl, col)
            end
        end,
    },
}
