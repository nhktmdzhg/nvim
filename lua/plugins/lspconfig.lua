return {
	'neovim/nvim-lspconfig',
	lazy = true,
	dependencies = { 'williamboman/mason-lspconfig.nvim' },
	ft = {
		'lua',
		'c',
		'cpp',
		'python',
		'rust',
		'html',
		'javascript',
		'javascriptreact',
		'typescript',
		'typescriptreact',
		'json',
		'css',
	},
	config = function()
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		local lspconfig = require('lspconfig')

		local servers = {
			'lua_ls',
			'clangd',
			'jedi_language_server',
			'rust_analyzer',
			'html',
			'eslint',
			'cssls',
		}

		for _, server in ipairs(servers) do
			lspconfig[server].setup({
				capabilities = capabilities,
			})
		end
	end,
}
