return {
	'zbirenbaum/copilot.lua',
	lazy = true,
	cmd = 'Copilot',
	event = 'InsertEnter',
	opts = {
		filetypes = {
			yaml = true,
			markdown = true,
			help = true,
			gitcommit = true,
			gitrebase = true,
			hgcommit = true,
			svn = true,
			cvs = true,
			['.'] = true,
		},
		suggestion = {
			auto_trigger = true,
		},
		panel = {
			auto_refresh = true,
		},
	},
}
