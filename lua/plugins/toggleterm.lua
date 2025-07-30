---@diagnostic disable: undefined-global
return {
	'akinsho/toggleterm.nvim',
	version = '*',
	lazy = true,
	keys = {
		{ '<F9>', ':ToggleTerm direction=float<CR>' },
		{ '<C-k>', ':bd!<CR>' },
		{ '<esc>', '<C-\\><C-n>', mode = 't' },
	},
	cmd = { 'ToggleTerm' },
	opts = {
		size = 20,
		open_mapping = nil, -- Disable default mapping to avoid conflicts
		hide_numbers = true, -- Hide line numbers in terminal
		shade_filetypes = {},
		shade_terminals = true,
		shading_factor = '1', -- Degree of darken terminal color
		start_in_insert = true, -- Start terminal in insert mode
		insert_mappings = true, -- Apply mappings in insert mode
		terminal_mappings = true, -- Apply mappings in terminal mode
		persist_size = true,
		persist_mode = true, -- Remember last terminal mode
		direction = 'float',
		close_on_exit = true, -- Close terminal when process exits
		shell = vim.o.shell, -- Use default shell
		auto_scroll = true, -- Auto scroll to bottom on terminal output
		float_opts = {
			border = 'curved',
			width = function()
				return math.floor(vim.o.columns * 0.8)
			end,
			height = function()
				return math.floor(vim.o.lines * 0.8)
			end,
			winblend = 3,
		},
	},
}
