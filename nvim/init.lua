require("vim-options")

-- #######################################
-- #        Set up lazy plugin manager
-- #######################################
-- download lazy if doesn't exist
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
-- boot up lazy
require("lazy").setup("plugins")

-- #######################################
-- #        Keybindings
-- #######################################
-- no search highlight
vim.keymap.set("n", "<C-n>", ":nohl<CR>", {})

-- center when navigatin
vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {})
vim.keymap.set("n", "n", "nzz", {})
vim.keymap.set("n", "N", "Nzz", {})
vim.keymap.set("n", "G", "Gzz", {})

-- Ctrl+s to save (can't fight muscle memory)
vim.keymap.set("n", "<C-s>", ":w<CR>", {})

-- Diagnostic keymaps
vim.keymap.set("n", "gE", vim.diagnostic.goto_prev, { desc = "[G]o to previous Diagnostic m[E]ssage" })
vim.keymap.set("n", "ge", vim.diagnostic.goto_next, { desc = "[G]o to next Diagnostic m[e]ssage" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- LSP stuff
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: [C]ode [A]ction" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format buffer" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[N]ame symbol" })

-- Navigate windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Move to new split
vim.keymap.set("n", "<C-w>v", "<C-w>v<C-w>l", {})
vim.keymap.set("n", "<C-w>s", "<C-w>s<C-w>j", {})

-- Replace back and forward slashes
vim.keymap.set("n", "<leader>r\\", [[:s/\//\\/g<CR>]], { desc = "Replace \\ -> /", silent = true })
vim.keymap.set("n", "<leader>r/", [[:s/\\/\//g<CR>]], { desc = "Replace / -> \\", silent = true })
