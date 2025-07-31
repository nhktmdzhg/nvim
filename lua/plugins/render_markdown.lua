return {
	'MeanderingProgrammer/render-markdown.nvim',
	dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
	lazy = true,
	keys = {
		{ '<C-S-p>', ':RenderMarkdown toggle<CR>', mode = { 'n', 'v', 'i' }, desc = 'Toggle Render Markdown' },
	},
	ft = { 'markdown', 'latex', 'html', 'markdown_inline' },
	opts = {
		code = {
			width = 'block',
		},
	},
}
