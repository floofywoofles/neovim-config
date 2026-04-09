return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
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
            local caps = require("cmp_nvim_lsp").default_capabilities()
            local format_group = vim.api.nvim_create_augroup("LspFormatting", {})

            local on_attach = function(client, bufnr)
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
            end

            vim.g.rustaceanvim = {
                server = {
                    on_attach = on_attach,
                    capabilities = caps,
                },
            }

            m_lsp.setup({
                ensure_installed = { "pyright", "vtsls", "lua_ls", "clangd", "gopls", "rust_analyzer" },
                handlers = {
                    function(server_name)
                        if server_name == "rust_analyzer" then
                            return
                        end
                        if server_name == "ts_ls" or server_name == "tsserver" then
                            return
                        end
                        require("lspconfig")[server_name].setup({
                            capabilities = caps,
                            on_attach = on_attach,
                        })
                    end,
                },
            })
            local cmp = require("cmp")
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                }),
                sources = { { name = "nvim_lsp" } },
            })
        end,
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
                ensure_installed = { "black", "prettier", "stylua", "clang-format", "gofumpt", "goimports-reviser" },
                automatic_installation = true,
            })
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.gofumpt,
                    null_ls.builtins.formatting.goimports_reviser,
                },
            })
        end,
    },
}
