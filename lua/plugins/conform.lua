---@diagnostic disable: undefined-global
return {
	'stevearc/conform.nvim',
	lazy = true,
	keys = {
		{
			'<C-S-f>',
			function()
				require('conform').format({ async = true, lsp_format = 'fallback' })
			end,
			mode = '',
			desc = 'Format buffer',
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { 'stylua' },
			python = { 'black' },
			rust = { 'rustfmt', lsp_format = 'fallback' },
			javascript = { 'prettier' },
			cpp = { 'clang_format' },
			c = { 'clang_format' },
			html = { 'prettier' },
			css = { 'prettier' },
			json = { 'prettier' },
			typescript = { 'prettier' },
			typescriptreact = { 'prettier' },
			javascriptreact = { 'prettier' },
			markdown = { 'prettier' },
			yaml = { 'prettier' },
		},
		formatters = {
			stylua = {
				prepend_args = { '--quote-style', 'AutoPreferSingle', '--sort-requires' },
			},
			prettier = {
				prepend_args = { '--single-quote', '--trailing-comma', 'none', '--tab-width', '2' },
			},
			clang_format = {
				prepend_args = { '--style={BasedOnStyle: llvm, IndentWidth: 4}' },
			},
		},
	},
}
