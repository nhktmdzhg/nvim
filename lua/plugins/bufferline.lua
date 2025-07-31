---@diagnostic disable: undefined-global
return {
	'akinsho/bufferline.nvim',
	version = '*',
	lazy = true,
	event = 'BufAdd',
	keys = {
		{ '<C-Tab>', ':BufferLineCycleNext<CR>' },
		{ '<C-S-w>', ':bdelete<CR>' },
	},
	dependencies = { 'nvim-tree/nvim-web-devicons', 'catppuccin/nvim' },
	opts = {
		options = {
			indicator = {
				style = 'none',
			},
			diagnostics = 'nvim_lsp',
			right_mouse_command = 'buffer %d',
			diagnostics_update_on_event = true,
			show_buffer_icons = true,
			show_buffer_close_icons = true,
			show_close_icon = false, -- Disable global close icon
			show_tab_indicators = true,
			persist_buffer_sort = true, -- Remember buffer order
			separator_style = 'thin',
			enforce_regular_tabs = false,
			always_show_bufferline = true,
			sort_by = 'insert_after_current', -- New buffers after current
			custom_filter = function(buf_number, _)
				-- Hide terminal buffers from bufferline
				if vim.bo[buf_number].filetype == 'toggleterm' then
					return false
				end
				return true
			end,
			offsets = {
				{
					filetype = 'NvimTree',
					text = ' File Explorer',
					text_align = 'center',
					separator = true,
				},
			},
			color_icons = true,
		},
		highlights = require('catppuccin.groups.integrations.bufferline').get(),
	},
}
