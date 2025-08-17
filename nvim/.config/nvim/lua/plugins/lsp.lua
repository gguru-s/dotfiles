return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },

        "nvim-telescope/telescope.nvim",
        "j-hui/fidget.nvim",
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(event)
                local map = function(keys, func, desc, mode)
                    mode = mode or "n"
                    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end

                map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                map("<leader>ca", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
                map("<leader>gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
                map("<leader>gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
                map("<leader>gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
                map("<leader>gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                map("gO", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")
                map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")
                map("<leader>gt", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype Definition")
                -- map("<leader>gs", vim.lsp.buf.signature_help, "LSP: signature help")
                map("K", function()
                    vim.lsp.buf.hover({
                        border = "single",
                    })
                end, "LSP Hover with rounded look")

                -- Diagnostic keymaps
                map("[d", vim.diagnostic.goto_prev, "Go to previous diagnostic message")
                map("]d", vim.diagnostic.goto_next, "Go to next diagnostic message")
                map("<leader>xf", vim.diagnostic.open_float, "Open floating diagnostic message")

                local function client_supports_method(client, method, bufnr)
                    if vim.fn.has("nvim-0.11") == 1 then
                        return client:supports_method(method, bufnr)
                    else
                        return client.supports_method(method, { bufnr = bufnr })
                    end
                end

                -- The following two autocommands are used to highlight references of the
                -- word under your cursor when your cursor rests there for a little while.
                --    See `:help CursorHold` for information about when this is executed
                --
                -- When you move your cursor, the highlights will be cleared (the second autocommand).
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if
                    client
                    and client_supports_method(
                        client,
                        vim.lsp.protocol.Methods.textDocument_documentHighlight,
                        event.buf
                    )
                then
                    local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
                    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.clear_references,
                    })

                    vim.api.nvim_create_autocmd("LspDetach", {
                        group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
                        callback = function(event2)
                            vim.lsp.buf.clear_references()
                            vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
                        end,
                    })
                end

                -- The following code creates a keymap to toggle inlay hints in your
                -- code, if the language server you are using supports them
                --
                -- This may be unwanted, since they displace some of your code
                if
                    client
                    and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
                then
                    map("<leader>th", function()
                        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
                    end, "[T]oggle Inlay [H]ints")
                end
            end,
        })

        -- Diagnostic Config
        -- See :help vim.diagnostic.Opts
        vim.diagnostic.config({
            float = { border = "single" },
            severity_sort = true,
            underline = { severity = vim.diagnostic.severity.ERROR },
            signs = {
                priority = 100, -- High priority to push it to left column
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.INFO] = "󰋼",
                    [vim.diagnostic.severity.HINT] = "󰌵",
                },
                -- text = {
                --     [vim.diagnostic.severity.ERROR] = "󰅚 ",
                --     [vim.diagnostic.severity.WARN] = "󰀪 ",
                --     [vim.diagnostic.severity.INFO] = "󰋽 ",
                --     [vim.diagnostic.severity.HINT] = "󰌶 ",
                -- },
                texthl = {
                    [vim.diagnostic.severity.ERROR] = "Error",
                    [vim.diagnostic.severity.WARN] = "Warn",
                    [vim.diagnostic.severity.HINT] = "Hint",
                    [vim.diagnostic.severity.INFO] = "Info",
                },
                numhl = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.HINT] = "",
                    [vim.diagnostic.severity.INFO] = "",
                },
            },
            virtual_text = false,
        })

        -- local border = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }

        local border = {
            { "┌", "FloatBorder" },
            { "─", "FloatBorder" },
            { "┐", "FloatBorder" },
            { "│", "FloatBorder" },
            { "┘", "FloatBorder" },
            { "─", "FloatBorder" },
            { "└", "FloatBorder" },
            { "│", "FloatBorder" },
        }
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })

        -- vim.lsp.handlers["textDocument/signatureHelp"] =
        --     vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })
        --
        -- vim.lsp.buf.signature_help({ border = border })

        -- vim.lsp.buf.signature_help({
        --     border = "single",
        -- })

        -- require("lspconfig.ui.windows").default_options = {
        --     border = "single",
        -- }
    end,
}
