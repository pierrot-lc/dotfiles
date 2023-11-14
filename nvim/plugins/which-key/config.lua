vim.opt.timeout = true
vim.opt.timeoutlen = 300

require("which-key").setup()
require("which-key").register({
	["<Leader>v"] = { name = "+Neovim" },
})
