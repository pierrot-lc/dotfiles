require("dap")

local sign = vim.fn.sign_define
sign("DapBreakpoint", {
	text = " ",
	texthl = "DapBreakpoint",
	linehl = "",
	numhl = "",
})
sign("DapBreakpointCondition", {
	text = " ",
	texthl = "DapBreakpointCondition",
	linehl = "",
	numhl = "",
})
sign("DapLogPoint", {
	text = "◆ ",
	texthl = "DapLogPoint",
	linehl = "",
	numhl = "",
})

vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dc", "<cmd>DapContinue<cr>", { desc = "Run/continue" })
vim.keymap.set("n", "<leader>do", "<cmd>DapStepOver<cr>", { desc = "Step over" })
vim.keymap.set("n", "<leader>di", "<cmd>DapStepInto<cr>", { desc = "Step into" })
vim.keymap.set("n", "<leader>dt", "<cmd>DapTerminate<cr>", { desc = "Terminate" })

if pcall(require, "which-key") then
	require("which-key").register({
		["<Leader>d"] = { name = "+Debugger" },
	})
end
