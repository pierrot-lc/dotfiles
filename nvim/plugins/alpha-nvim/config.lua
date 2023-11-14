local dashboard = require("alpha.themes.dashboard")
local logo = [[
$$\   $$\                    $$\    $$\ $$\
$$$\  $$ |                   $$ |   $$ |\__|
$$$$\ $$ | $$$$$$\   $$$$$$\ $$ |   $$ |$$\ $$$$$$\$$$$\
$$ $$\$$ |$$  __$$\ $$  __$$\\$$\  $$  |$$ |$$  _$$  _$$\
$$ \$$$$ |$$$$$$$$ |$$ /  $$ |\$$\$$  / $$ |$$ / $$ / $$ |
$$ |\$$$ |$$   ____|$$ |  $$ | \$$$  /  $$ |$$ | $$ | $$ |
$$ | \$$ |\$$$$$$$\ \$$$$$$  |  \$  /   $$ |$$ | $$ | $$ |
\__|  \__| \_______| \______/    \_/    \__|\__| \__| \__|


]]

dashboard.section.header.val = vim.split(logo, "\n")
dashboard.section.buttons.val = {
	dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert<CR>"),
	dashboard.button("p", " " .. " Projects", ":Telescope repo list<CR>"),
	dashboard.button("r", "󱋡 " .. " Recent files", ":Telescope oldfiles<CR>"),
	dashboard.button("f", "󰈢 " .. " Find file", ":Telescope find_files<CR>"),
	dashboard.button("g", "󰺮 " .. " Find text", ":Telescope live_grep<CR>"),
	dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}
for _, button in ipairs(dashboard.section.buttons.val) do
	button.opts.hl = "AlphaButtons"
	button.opts.hl_shortcut = "AlphaShortcut"
end
dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.section.buttons.opts.hl = "AlphaButtons"
dashboard.opts.layout[1].val = 8

require("alpha").setup(dashboard.opts)
