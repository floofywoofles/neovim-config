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
            require("mason").setup()
            local m_lsp = require("mason-lspconfig")
            local caps = require("cmp_nvim_lsp").default_capabilities()
            m_lsp.setup({
                ensure_installed = { "pyright", "ts_ls", "lua_ls", "clangd" },
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({
                            capabilities = caps,
                            on_attach = function(_, bufnr)
                                local b = { buffer = bufnr }
                                vim.keymap.set("n", "K", vim.lsp.buf.hover, b)
                            end,
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
        "nvimtools/none-ls.nvim",
        dependencies = { "jay-babu/mason-null-ls.nvim" },
        config = function()
            local null_ls = require("null-ls")
            require("mason-null-ls").setup({
                ensure_installed = { "black", "prettier", "stylua", "clang-format" },
                automatic_installation = true,
            })
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.formatting.stylua,
                },
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = bufnr })
                            end,
                        })
                    end
                end,
            })
        end,
    },
}
