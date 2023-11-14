vim.g.linefly_options = {
		tabline = true,
		winbar = true,
		with_file_icon = true,
		with_git_branch = true,
		with_git_status = true,
		with_diagnostic_status = true,
		with_indent_status = true,
}
vim.opt.showmode = false -- Remove the default status line.

-- Set linefly colors.
local highlight = vim.api.nvim_set_hl
highlight(0, "LineflyNormal", { link = "DiffChange" })
highlight(0, "LineflyInsert", { link = "WildMenu" })
highlight(0, "LineflyVisual", { link = "IncSearch" })
highlight(0, "LineflyCommand", { link = "WildMenu" })
highlight(0, "LineflyReplace", { link = "ErrorMsg" })
