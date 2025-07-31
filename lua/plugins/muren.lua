return {
	'AckslD/muren.nvim',
	lazy = true,
	keys = {
		{
			'<C-f>',
			function()
				require('muren.api').toggle_ui()
			end,
		},
	},
	config = true,
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
}
