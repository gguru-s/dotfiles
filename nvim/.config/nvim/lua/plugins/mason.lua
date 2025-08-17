return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "neovim/nvim-lspconfig",
        -- "saghen/blink.cmp",
        "Hoffs/omnisharp-extended-lsp.nvim",
    },
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        -- local capabilities = require("blink.cmp").get_lsp_capabilities()
        -- capabilities.textDocument.completion.completionItem.snippetSupport = true

        local mason_tool_installer = require("mason-tool-installer")
        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {
                "cmake",
                "jedi_language_server",
                "rust_analyzer",
                "clangd",
                "lua_ls",
                "omnisharp",
                "vimls",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,

                require("lspconfig").clangd.setup({
                    capabilities = capabilities,
                    cmd = {
                        "clangd",
                        "--background-index",
                        "--clang-tidy",
                        "--header-insertion=iwyu",
                        "--completion-style=detailed",
                        "--function-arg-placeholders=0",
                        "--fallback-style=llvm",
                        "--enable-config",
                    },
                }),

                require("lspconfig").omnisharp.setup({
                    capabilities = capabilities,
                    handlers = {
                        ["textDocument/definition"] = require("omnisharp_extended").definition_handler,
                        ["textDocument/typeDefinition"] = require("omnisharp_extended").type_definition_handler,
                        ["textDocument/references"] = require("omnisharp_extended").references_handler,
                        ["textDocument/implementation"] = require("omnisharp_extended").implementation_handler,
                    },
                    cmd = {
                        vim.fn.executable("OmniSharp") == 1 and "OmniSharp" or "omnisharp",
                        "-z", -- https://github.com/OmniSharp/omnisharp-vscode/pull/4300
                        "--hostPID",
                        tostring(vim.fn.getpid()),
                        "DotNet:enablePackageRestore=false",
                        "--encoding",
                        "utf-8",
                        "--languageserver",
                    },
                    filetypes = { "cs", "vb" },
                    init_options = {},
                    settings = {
                        FormattingOptions = {
                            EnableEditorConfigSupport = true,
                            OrganizeImports = nil,
                        },
                        MsBuild = {
                            LoadProjectsOnDemand = nil,
                        },
                        RoslynExtensionsOptions = {
                            EnableAnalyzersSupport = nil,
                            EnableImportCompletion = nil,
                            AnalyzeOpenDocumentsOnly = nil,
                            EnableDecompilationSupport = nil,
                        },
                        RenameOptions = {
                            RenameInComments = nil,
                            RenameOverloads = nil,
                            RenameInStrings = nil,
                        },
                        Sdk = {
                            IncludePrereleases = true,
                        },
                    },
                }),

                require("lspconfig").lua_ls.setup({
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                }),
            },
        })

        mason_tool_installer.setup({
            ensure_installed = {
                "prettier",
                "stylua",
                "isort",
                "black",
                "clang-format",
                "csharpier",
            },
        })
    end,
}
