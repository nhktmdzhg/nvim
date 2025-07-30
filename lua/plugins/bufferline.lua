---@diagnostic disable: undefined-global
return {
	"akinsho/bufferline.nvim",
	version = "*",
	lazy = true,
	keys = {
		{ "<C-Tab>", ":BufferLineCycleNext<CR>" },
		{ "<C-S-w>", ":bdelete<CR>" },
	},
	dependencies = "nvim-tree/nvim-web-devicons",
	config = {
		options = {
			indicator = {
				style = "none",
			},
			diagnostics_update_in_insert = false, -- Don't update diagnostics in insert mode
			show_buffer_icons = true,
			show_buffer_close_icons = false, -- Disable close icons for cleaner look
			show_close_icon = false,     -- Disable global close icon
			show_tab_indicators = true,
			persist_buffer_sort = true,  -- Remember buffer order
			separator_style = "thin",    -- Thin separators for less visual noise
			enforce_regular_tabs = false,
			always_show_bufferline = true,
			sort_by = "insert_after_current", -- New buffers after current
			custom_filter = function(buf_number, _)
				-- Hide terminal buffers from bufferline
				if vim.bo[buf_number].filetype == "toggleterm" then
					return false
				end
				return true
			end,
			offsets = {
				{
					filetype = "NvimTree",
					text = " File Explorer",
					text_align = "center",
					separator = true,
				},
			},
		},
	},
}
