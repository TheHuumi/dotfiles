return {
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    { "hrsh7th/cmp-nvim-lua" },
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },
	{
		"hrsh7th/nvim-cmp",
		config = function()
			-- Set up nvim-cmp.
			local cmp = require("cmp")

			cmp.setup({
                snippet = {
                    expand = function(args)
                        -- vim.snippet.expand(args.body)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "nvim_lsp_signature_help" },
                    { name = "nvim_lua" },
                    { name = "luasnip" },
                    { name = "buffer" },
                },
                formatting = {
                    fields = { "abbr", "kind" }
                }
			}, {
                { name = "buffer" },
            })

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            require("lspconfig")["rust_analyzer"].setup {
                capabilities = capabilities
            }
            require("lspconfig")["csharp-language-server"].setup {
                capabilities = capabilities
            }
            require("lspconfig")["omnisharp"].setup {
                capabilities = capabilities
            }
		end,
	},
    -- Autopairs parenthesis
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
    }
}
