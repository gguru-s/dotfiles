local M = {}

local saved_layout = nil

function M.save_layout()
    local function build_tree(layout)
        local kind = layout[1]
        if kind == "leaf" then
            local winid = layout[2]
            local buf = vim.api.nvim_win_get_buf(winid)
            return {
                type = "leaf",
                buf = buf,
                view = vim.fn.winsaveview(),
            }
        else
            local children = {}
            for _, child in ipairs(layout[2]) do
                table.insert(children, build_tree(child))
            end
            return { type = kind, children = children }
        end
    end

    saved_layout = build_tree(vim.fn.winlayout())
end

-- Hide all other windows (leave only current)
function M.focus_current_window()
    M.save_layout()
    vim.cmd("only")
end

-- Restore previous layout
function M.restore_layout()
    if not saved_layout then
        vim.notify("No layout saved", vim.log.levels.WARN)
        return
    end

    -- Close all windows except one
    local current_win = vim.api.nvim_get_current_win()
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        if win ~= current_win then
            vim.api.nvim_win_close(win, true)
        end
    end

    -- Load first buffer
    local function restore_tree(tree, is_root, parent_split)
        if tree.type == "leaf" then
            local buf = tree.buf
            if vim.api.nvim_buf_is_valid(buf) then
                if not is_root then
                    -- Use correct split type based on parent
                    if parent_split == "row" then
                        vim.cmd("vsplit")
                    elseif parent_split == "col" then
                        vim.cmd("split")
                    end
                end
                vim.api.nvim_win_set_buf(0, buf)
                if tree.view then
                    vim.fn.winrestview(tree.view)
                end
            end
        else
            for i, child in ipairs(tree.children) do
                restore_tree(child, is_root and i == 1, tree.type)
                if i < #tree.children then
                    vim.cmd("wincmd l") -- move to the last created window
                end
            end
        end
    end

    restore_tree(saved_layout, true, nil)
    saved_layout = nil
end

vim.keymap.set("n", "<leader>ws", M.focus_current_window, { desc = "Hide other windows" })
vim.keymap.set("n", "<leader>wr", M.restore_layout, { desc = "Restore window layout" })
