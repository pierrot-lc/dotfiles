require("ranger-nvim").setup({
	replace_netrw = true,
})

vim.api.nvim_create_user_command("Ranger", require("ranger-nvim").open, { desc = "Open ranger" })
vim.keymap.set("n", "<leader>r", require("ranger-nvim").open, { desc = "Open ranger" })
