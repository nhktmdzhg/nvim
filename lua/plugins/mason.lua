return {
	'williamboman/mason.nvim',
	lazy = true,
	event = 'VeryLazy',
	opts = {
		ui = {
			border = 'rounded',
			icons = {
				package_installed = '✓',
				package_pending = '➜',
				package_uninstalled = '✗',
			},
		},
	},
}
