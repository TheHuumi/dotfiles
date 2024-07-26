return {
	-- indentation guides
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = {
				char = "┆",
			},
		},
	},
	{
		"loctvl842/monokai-pro.nvim",
		config = function()
			require("monokai-pro").setup({
                styles = {
                    keyword = { italic = false },
                    type = { italic = false },
                    storageclass = { italic = false },
                    structure = { italic = false },
                    parameter = { italic = false },
                    annotation = { italic = false },
                }
            })

			vim.cmd("colorscheme monokai-pro")
		end,
	},
}
