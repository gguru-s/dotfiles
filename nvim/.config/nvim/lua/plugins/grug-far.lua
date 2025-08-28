return {
    "MagicDuck/grug-far.nvim",
    opts = { headerMaxWidth = 80 },
    cmd = "GrugFar",
    keys = {
        {
            "<leader>sr",
            function()
                local grug = require("grug-far")
                local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
                grug.open({
                    transient = false,
                    prefills = {
                        filesFilter = ext and ext ~= "" and "*." .. ext or nil,
                    },
                })
            end,
            mode = { "n", "v" },
            desc = "Search and Replace",
        },
        {
            "<leader>sc",
            function()
                local grug = require("grug-far")
                grug.open({
                    transient = false,
                    prefills = {
                        search = vim.fn.expand("<cword>"),
                        paths = vim.fn.expand("%"),
                    },
                })
            end,
        },
    },
}
