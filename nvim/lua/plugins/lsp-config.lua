return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "rust-analyzer",
            }
        },
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup()
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("lspconfig").rust_analyzer.setup({
                settings = {
                    ["rust-analyzer"] = {},
                },
            })
            require("lspconfig").omnisharp.setup({})
            require("lspconfig").csharp_ls.setup({})
        end
    },
}
