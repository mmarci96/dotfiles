return {
    {
        "stevearc/conform.nvim",
        event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "typescript", "javascript", "vim", "lua", "vimdoc", "html",
            },
            highlight = { enable = true },
        },
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require "custom.cmp" -- Reference to custom completion config
        end,

    },
}
