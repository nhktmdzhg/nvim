return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	lazy = true,
	keys = {
		{
			'<F7>',
			':Telescope<CR>',
			mode = 'n',
		},
	},
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope-fzf-native.nvim',
		'nvim-telescope/telescope-ui-select.nvim',
	},
	config = function()
		require('telescope').setup({
			defaults = {
				layout_strategy = 'horizontal',
				layout_config = { width = 0.95, height = 0.9 },
				mappings = {
					i = {
						['<C-u>'] = false,
						['<C-d>'] = require('telescope.actions').delete_buffer,
					},
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
				},
			},
		})

		require('telescope').load_extension('fzf')
		require('telescope').load_extension('ui-select')
	end,
}
