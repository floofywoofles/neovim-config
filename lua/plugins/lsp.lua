return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "saghen/blink.cmp",
        },
        config = function()
            -- DIAGNOSTIC CONFIG
            vim.diagnostic.config({
                virtual_text = {
                    spacing = 4,
                    prefix = "●",
                },
                severity_sort = true,
                float = {
                    border = "rounded",
                    source = "always",
                },
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN] = " ",
                        [vim.diagnostic.severity.HINT] = "󰌵 ",
                        [vim.diagnostic.severity.INFO] = " ",
                    },
                },
            })

            require("mason").setup()
            local m_lsp = require("mason-lspconfig")
            local caps = require("blink.cmp").get_lsp_capabilities()
            local format_group = vim.api.nvim_create_augroup("LspFormatting", {})

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local bufnr = args.buf
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if not client then
                        return
                    end

                    local b = { buffer = bufnr }
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, b)

                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({ group = format_group, buffer = bufnr })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = format_group,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = bufnr })
                            end,
                        })
                    end
                end,
            })

            vim.lsp.config("*", {
                capabilities = caps,
            })

            vim.g.rustaceanvim = {
                server = {},
            }

            m_lsp.setup({
                ensure_installed = { "pyright", "vtsls", "lua_ls", "clangd", "gopls", "rust_analyzer", "nim_langserver" },
                handlers = {
                    function(server_name)
                        if server_name == "rust_analyzer" then
                            return
                        end
                        if server_name == "ts_ls" or server_name == "tsserver" then
                            return
                        end
                        vim.lsp.enable(server_name)
                    end,
                },
            })
            vim.lsp.enable("gleam")
        end,
    },
    {
        "saghen/blink.cmp",
        dependencies = "rafamadriz/friendly-snippets",
        version = "*",
        opts = {
            keymap = {
                preset = "super-tab",
            },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
            completion = {
                list = {
                    selection = {
                        preselect = true,
                        auto_insert = true,
                    },
                },
                menu = {
                    border = "rounded",
                },
                documentation = {
                    window = {
                        border = "rounded",
                    },
                },
            },
        },
        opts_extend = { "sources.default" },
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^5", -- Recommended
        lazy = false, -- This plugin is already lazy
    },
    {
        "nvimtools/none-ls.nvim",
        dependencies = { "jay-babu/mason-null-ls.nvim" },
        config = function()
            local null_ls = require("null-ls")
            require("mason-null-ls").setup({
                ensure_installed = { "black", "prettier", "stylua", "clang-format", "gofumpt", "goimports-reviser", "nimpretty" },
                automatic_installation = true,
            })
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.gofumpt,
                    null_ls.builtins.formatting.goimports_reviser,
                    null_ls.builtins.formatting.gleam_format,
                    null_ls.builtins.formatting.nimpretty,
                },
            })
        end,
    },
}
