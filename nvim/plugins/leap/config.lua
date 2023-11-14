local leap_jump = function()
	require("leap").leap({ target_windows = { vim.fn.win_getid() } })
end

vim.keymap.set("n", "<leader>s", leap_jump, { desc = "Leap jump" })
