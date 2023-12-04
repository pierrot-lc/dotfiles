require("symbols-outline").setup({
	replace_netrw = true,
})

vim.keymap.set("n", "<leader>lo", ":SymbolsOutline<CR>", { desc = "Toggle symbols outline" })
