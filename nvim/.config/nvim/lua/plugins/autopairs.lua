return {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    enabled = true,
    dependencies = {
        -- "hrsh7th/nvim-cmp",
        "saghen/blink.cmp",
    },
    config = function()
        -- import nvim-autopairs
        local autopairs = require("nvim-autopairs")

        -- configure autopairs
        autopairs.setup({
            check_ts = true, -- enable treesitter
            ts_config = {
                lua = { "string" }, -- don't add pairs in lua string treesitter nodes
                javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
                java = false, -- don't check treesitter on java
            },
        })

        -- import nvim-autopairs completion functionality
        -- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        --
        -- -- import nvim-cmp plugin (completions plugin)
        -- local cmp = require("cmp")
        --
        -- -- make autopairs and completion work together
        -- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

        -- Integrate manually with Blink
        -- local Rule = require("nvim-autopairs.rule")
        --
        -- -- Register a handler when completion is confirmed
        -- require("blink.cmp").events:on("confirm_done", function(item, ctx)
        --     -- mimic nvim-cmp confirm_done behavior
        --     local keys = autopairs.autopairs_cr()
        --     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, true, true), "n", true)
        -- end)
    end,
}
