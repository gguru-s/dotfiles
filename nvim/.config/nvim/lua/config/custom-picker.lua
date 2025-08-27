local Snacks = require("snacks")

local api = vim.api

local function pick_window_in_tab()
    local wins = api.nvim_tabpage_list_wins(0)
    local items = {}

    for _, win in ipairs(wins) do
        local buf = api.nvim_win_get_buf(win)
        local name = api.nvim_buf_get_name(buf)
        local filename = name ~= "" and vim.fn.fnamemodify(name, ":t") or "[No Name]"
        table.insert(items, {
            text = filename,
            win_id = win,
        })
    end

    Snacks.picker.pick({
        items = items,
        format = "text",
        title = "Pick a Window",
        layout = {
            layout = {
                backdrop = false,
                row = 2,
                box = "vertical",
                width = 0.4,
                min_width = 50,
                height = 0.3,
                min_height = 10,
                {
                    win = "input",
                    height = 1,
                    border = "hpad",
                },
                { win = "list", border = "rounded" },
            },
        },
        confirm = function(picker, item)
            picker:close()
            if item and item.win_id then
                api.nvim_set_current_win(item.win_id)
            else
                vim.notify("Invalid window", vim.log.levels.ERROR)
            end
        end,
    })
end

-- Optional keymap
vim.keymap.set("n", "<leader>dw", pick_window_in_tab, { desc = "Pick window in tab" })
