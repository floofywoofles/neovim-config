return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            ensure_installed = { "lua", "python", "typescript", "c", "cpp", "markdown", "markdown_inline", "go", "rust", "gleam", "nim" },
            highlight = { enable = true },
            indent = { enable = true },
        },
    },
}
