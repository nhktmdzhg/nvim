---@diagnostic disable: undefined-global
local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end
alpha.setup(require("alpha.themes.dashboard").config)
local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡠⠤⠖⠲⠤⠤⠴⠶⠶⠤⢤⣀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠖⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠲⢤⡀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠔⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠢⡀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⡰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢦",
	"⠀⠀⠀⠀⠀⠀⡠⠚⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢳⡀",
	"⠀⠀⠀⠀⢀⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠀⠀⠀⠀⠀⢣⡀",
	"⠀⠀⠀⢀⡎⢀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡸⠀⠀⠀⠀⠀⠀⢳",
	"⠀⠀⠀⢸⢠⢻⠀⢀⠀⠃⠀⠀⠀⠀⢠⠀⠀⠀⠀⠀⢀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠀⠀⠀⠈⡇",
	"⠀⠀⠀⠀⠁⢸⠀⠀⠀⠑⠁⠀⠀⢠⢋⡇⠀⠀⠀⠀⡸⢵⡀⠀⢄⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⢸⣆⡇",
	"⢇⣀⠑⠀⠀⢸⠀⢀⠀⠀⠀⣦⠀⡞⠁⢱⡀⠀⠀⠰⡁⠀⠑⢄⠘⡗⢄⣀⡀⠀⠀⠀⠀⠘⢄⠀⢸⠘⠁",
	"⠀⢀⠄⠀⠀⢸⠀⠘⡄⠀⠀⣇⣑⣣⣄⡀⠑⠼⠦⠤⠵⠄⢀⣀⣿⣭⣀⣀⡇⠀⠀⠀⢰⡤⠤⠙⡎",
	"⠀⠈⠂⠁⣠⠏⠀⡀⠘⠄⠀⢿⠛⠛⠛⠛⠓⠀⠀⠀⠀⠚⠛⠉⠙⠛⠛⡻⠀⠠⠘⢠⠧⢘⡆⠀⢧",
	"⠀⠀⠀⠘⠓⠒⢊⣷⣾⣿⣿⢏⡀⠀⠀⠀⠈⠱⣶⣶⣾⠃⠀⠀⠀⠀⠴⢵⠂⢀⡴⠁⣀⠜⢀⠀⠀⠙⢒⡦",
	"⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⢷⢉⡖⠤⣄⣀⣀⡙⠿⠟⡠⣄⣀⣃⠦⣶⡧⠔⡏⠉⠉⣱⡆⠀⢸⠉⠉⠁",
	"⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣠⢜⡟⣇⠀⣇⠀⡙⠯⣭⠝⡫⢵⠁⢀⡮⣘⣄⠀⠈⠦⣞⠁⣇⡰⠃",
	"⠀⠀⠀⠀⠀⠀⠈⢟⠰⠾⠣⠊⠱⣿⣦⣱⡉⠀⠰⠶⠀⠈⢺⠀⡎⠱⢅⠘⡝⠒⠊⠁⠀⠁",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠑⣦⣄⡠⢪⢿⡟⠀⠀⠀⢠⢢⠀⠀⠀⠙⣧⡴⠋⠑⠺⡀",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠊⠁⡼⡈⢒⣢⡤⢆⡀⠤⠤⠔⢲⣒⡇⢄⢀⡀⢱",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠒⡴⠁⠐⡧⢴⠏⠑⣄⣀⣸⡀⣧⣃⣑⣢⣭⠇",
	"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠓⠒⠊⠀⠀⠓⠤⠇⠀⠈⠉",
}
dashboard.section.footer.val = "Welcome to the world of ミツキナノカ"
dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"
dashboard.section.buttons.val = {
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("c", "  Configuration", function()
		vim.cmd("cd ~/.config/nvim")
		vim.cmd("e init.lua")
	end),
	dashboard.button("q", "󰗽  Quit Neovim", ":qa<CR>"),
}
