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

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local bufnr = args.buf
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if not client then
                        return
                    end

                    local b = { buffer = bufnr }
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, b)
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
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    "black",
                    "prettier",
                    "stylua",
                    "clang-format",
                    "gofumpt",
                    "goimports-reviser",
                },
            })
        end,
    },
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "black" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                go = { "gofumpt", "goimports-reviser" },
                c = { "clang-format" },
                cpp = { "clang-format" },
                gleam = { "gleam" },
                nim = { "nimpretty" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
        },
    },
}
