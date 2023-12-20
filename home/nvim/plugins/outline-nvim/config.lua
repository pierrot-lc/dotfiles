require("outline").setup({})

-- Use "!" operator to not change the window focus.
vim.keymap.set("n", "<leader>lo", ":Outline!<CR>", { desc = "Toggle symbols outline" })
