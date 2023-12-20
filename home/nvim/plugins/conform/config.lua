require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		sh = { "shfmt" },
		json = { "jq" },
		latex = { "latexindent" },
	},
})

vim.keymap.set("n", "<leader>F", require("conform").format, { desc = "Format" })
