require("mini.comment").setup({
	mappings = {
		comment = "gc",
		comment_line = "gcc",
		textobject = "gc",
	},
})

if pcall(require, "which-key") then
	require("which-key").register({
		["gc"] = { name = "+Comment" },
	})
end
