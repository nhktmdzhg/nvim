---@diagnostic disable: undefined-global
local function myname()
	return [[ミツキナノカ]]
end

local function mymode()
	local mode_api = require('lualine.utils.mode')
	local mode_code = vim.api.nvim_get_mode().mode
	if mode_api.map[mode_code] then
		return string.lower(mode_api.map[mode_code])
	else
		return mode_code
	end
end

return {
	'nvim-lualine/lualine.nvim',
	lazy = false,
	config = {
		options = {
			icons_enabled = true,
			theme = 'catppuccin',
			component_separators = {
				left = '|',
				right = '|',
			},
			section_separators = {
				left = '',
				right = '',
			},
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			always_show_tabline = true,
			globalstatus = true, -- Use global statusline for better performance
			refresh = {
				statusline = 1000, -- Reduced refresh rate for better performance
				tabline = 1000, -- Reduced refresh rate for better performance
				winbar = 1000, -- Reduced refresh rate for better performance
			},
		},
		sections = {
			lualine_a = { mymode },
			lualine_b = { 'branch', 'diff', 'diagnostics' },
			lualine_c = { myname, 'filename' },
			lualine_x = { 'filetype' },
			lualine_y = { 'encoding', 'fileformat' },
			lualine_z = { 'progress', 'location' },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { 'filename' },
			lualine_x = { 'location' },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	},
}
