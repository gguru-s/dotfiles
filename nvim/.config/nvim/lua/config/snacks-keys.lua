return {

    -- Top Pickers & Explorer
    {
        "<leader><space>",
        function()
            Snacks.picker.smart()
        end,
        desc = "Smart Find Files",
    },
    {
        "<leader>,",
        function()
            Snacks.picker.buffers()
        end,
        desc = "Find buffers",
    },
    {
        "<leader>/",
        function()
            Snacks.picker.grep()
        end,
        desc = "Find/search string",
    },
    {
        "<leader>:",
        function()
            Snacks.picker.command_history()
        end,
        desc = "Command History",
    },
    {
        "<leader>nh",
        function()
            Snacks.picker.notifications()
        end,
        desc = "Notification History",
    },
    {
        "<leader>e",
        function()
            Snacks.explorer()
        end,
        desc = "File Explorer",
    },
    -- find
    -- {
    --     "<leader>fb",
    --     function()
    --         Snacks.picker.buffers()
    --     end,
    --     desc = "Buffers",
    -- },
    {
        "<leader>ff",
        function()
            Snacks.picker.files()
        end,
        desc = "Find files",
    },
    {
        "<leader>fc",
        function()
            Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
        end,
        desc = "Find Config File",
    },
    {
        "<leader>fr",
        function()
            Snacks.picker.recent()
        end,
        desc = "Find recent files",
    },
    {
        "<leader>uh",
        function()
            Snacks.picker.undo()
        end,
        desc = "Undo History",
    },
    {
        "<leader>fw",
        function()
            Snacks.picker.grep_word()
        end,
        desc = "Find current word",
        mode = { "n", "x" },
    },
    {
        "<leader>fk",
        function()
            Snacks.picker.keymaps()
        end,
        desc = "Find keymaps",
    },
    -- Lsp
    {
        "gd",
        function()
            Snacks.picker.lsp_definitions()
        end,
        desc = "Goto Definition",
    },
    {
        "gD",
        function()
            Snacks.picker.lsp_declarations()
        end,
        desc = "Goto Declaration",
    },
    {
        "gr",
        function()
            Snacks.picker.lsp_references()
        end,
        nowait = true,
        desc = "Find References",
    },
    {
        "gI",
        function()
            Snacks.picker.lsp_implementations()
        end,
        desc = "Goto Implementation",
    },
    {
        "gy",
        function()
            Snacks.picker.lsp_type_definitions()
        end,
        desc = "Goto T[y]pe Definition",
    },
    {
        "<leader>ss",
        function()
            Snacks.picker.lsp_symbols()
        end,
        desc = "Lsp Document Symbols",
    },
    {
        "<leader>sS",
        function()
            Snacks.picker.lsp_workspace_symbols()
        end,
        desc = "Lsp Workspace Symbols",
    },
    {
        "<c-/>",
        function()
            Snacks.terminal()
        end,
        desc = "Toggle Terminal",
    },
    {
        "<c-_>",
        function()
            Snacks.terminal()
        end,
        desc = "which_key_ignore",
    },
    -- git
    {
        "<leader>gb",
        function()
            Snacks.picker.git_branches()
        end,
        desc = "Git Branches",
    },
    {
        "<leader>gl",
        function()
            Snacks.picker.git_log()
        end,
        desc = "Git Log",
    },
    {
        "<leader>gL",
        function()
            Snacks.picker.git_log_line()
        end,
        desc = "Git Log Line",
    },
    {
        "<leader>gs",
        function()
            Snacks.picker.git_status()
        end,
        desc = "Git Status",
    },
    {
        "<leader>gS",
        function()
            Snacks.picker.git_stash()
        end,
        desc = "Git Stash",
    },
    {
        "<leader>gd",
        function()
            Snacks.picker.git_diff()
        end,
        desc = "Git Diff (Hunks)",
    },
    {
        "<leader>gf",
        function()
            Snacks.picker.git_log_file()
        end,
        desc = "Git Log File",
    },
    {
        "<leader>sq",
        function()
            Snacks.picker.qflist()
        end,
        desc = "Quickfix List",
    },
}
