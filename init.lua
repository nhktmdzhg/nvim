---@diagnostic disable: undefined-global
-- Vim opt
vim.opt.mouse = 'a'
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.list = true
vim.opt.foldmethod = 'syntax'
vim.opt.foldnestmax = 1
vim.opt.foldlevelstart = 3
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.synmaxcol = 3000
vim.opt.lazyredraw = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.termguicolors = true

-- Performance optimizations
vim.opt.hidden = true -- Allow switching buffers without saving
vim.opt.wrap = false -- Disable line wrapping for better performance
vim.opt.conceallevel = 0 -- Show concealed text
vim.opt.scrolloff = 8 -- Keep 8 lines visible above/below cursor
vim.opt.sidescrolloff = 8 -- Keep 8 columns visible left/right of cursor
vim.opt.updatetime = 100 -- Faster completion (default is 4000ms)
vim.opt.timeoutlen = 500 -- Faster key sequence completion
vim.opt.redrawtime = 1500 -- Time limit for redrawing
vim.opt.maxmempattern = 5000 -- Memory limit for pattern matching
vim.opt.re = 0 -- Use automatic regexp engine selection

-- Better splitting
vim.opt.splitbelow = true -- New horizontal splits go below
vim.opt.splitright = true -- New vertical splits go right

-- Improve search
vim.opt.hlsearch = true -- Highlight search results
vim.opt.incsearch = true -- Incremental search
vim.opt.smartcase = true -- Smart case sensitivity (with ignorecase)

-- Better indentation
vim.opt.smartindent = true -- Smart autoindenting
vim.opt.autoindent = true -- Copy indent from current line

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
	pattern = '*.json',
	callback = function()
		vim.opt.foldmethod = 'indent'
	end,
})

vim.cmd('syntax on')

local function should_checktime()
	local current_mode = vim.api.nvim_get_mode().mode
	local cmd_type = vim.v.event == nil and '' or vim.fn.getcmdwintype()
	return not vim.tbl_contains({ 'c', 'r', 'r?', '!', 't' }, current_mode) and cmd_type == ''
end

local checktime_group = vim.api.nvim_create_augroup('CheckTimeAutoReload', {
	clear = true,
})

vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
	group = checktime_group,
	pattern = '*',
	callback = function()
		if should_checktime() then
			vim.cmd('checktime')
		end
	end,
})

vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter' }, {
	group = checktime_group,
	pattern = '*',
	callback = function()
		if should_checktime() then
			vim.cmd('checktime')
		end
	end,
})

local vim = vim

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
			{ out, 'WarningMsg' },
			{ '\nPress any key to exit...' },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Setup lazy.nvim
require('lazy').setup({
	spec = {
		{
			'catppuccin/nvim',
			name = 'catppuccin',
			lazy = false,
			priority = 1000,
		},
		{
			'junegunn/fzf',
			build = function()
				return vim.fn['fzf#install']()
			end,
			lazy = false,
		},
		{ 'ibhagwan/fzf-lua', lazy = false },
		{ 'windwp/nvim-autopairs', lazy = false },
		{ 'preservim/nerdcommenter', lazy = false },
		{ 'jackguo381/vim-lsp-cxx-highlight', lazy = true, ft = { 'cpp', 'c', 'h', 'hpp' } }, -- C/C++
		{ 'sheerun/vim-polyglot', lazy = true, event = 'BufReadPost' }, -- Multi-language
		{ 'yuezk/vim-js', lazy = true, ft = { 'javascript', 'javascriptreact' } }, -- JavaScript
		{ 'MaxMEllon/vim-jsx-pretty', lazy = true, ft = { 'javascript', 'javascriptreact' } }, -- JSX
		{ 'tpope/vim-fugitive', lazy = false }, -- Git information
		{ 'tpope/vim-rhubarb', lazy = false }, -- GitHub integration
		{ 'airblade/vim-gitgutter', lazy = true, event = 'BufReadPost' }, -- Git diff indicators
		{ 'samoshkin/vim-mergetool', lazy = true, cmd = { 'MergetoolToggle', 'MergetoolStart' } }, -- Merge tool
		{ 'tmhedberg/SimpylFold', lazy = true, ft = 'python' }, -- Python folding
		{ 'github/copilot.vim', lazy = false }, -- GitHub Copilot
		{ 'echasnovski/mini.icons', lazy = false, branch = 'stable' }, -- Mini icons
		{ 'goolord/alpha-nvim', lazy = true }, -- Greeter
		{ 'neovim/nvim-lspconfig' },
		{ 'williamboman/mason-lspconfig.nvim' },
		{ import = 'plugins' },
	},
	checker = { enabled = false },
})

require('nvim-autopairs').setup({})
require('mini.icons').setup()
vim.cmd.colorscheme('catppuccin-mocha')

vim.api.nvim_create_autocmd('FileType', {
	pattern = '*',
	command = 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o',
})

local keymap = vim.keymap.set
local opts = {
	noremap = true,
	silent = true,
}

keymap('n', '/\\', ':noh<CR>', opts)
keymap('n', '<leader>bd', ':bp <bar> sp <bar> bn <bar> bd<CR>', opts)
keymap('n', '<C-a>', 'gg<S-v>G', opts)
keymap('i', '<C-a>', '<Esc>gg<S-v>G', opts)
keymap('n', '<C-S>', ':write<CR>', opts)
keymap('i', '<C-S>', '<Esc>:write<CR>a', opts)
keymap('n', '<S-Del>', function()
	local clipboard = vim.fn.getreg('+')
	local clipboard_type = vim.fn.getregtype('+')
	vim.cmd([[normal! dd]])
	vim.fn.setreg('+', clipboard, clipboard_type)
end, opts)

keymap('i', '<S-Del>', function()
	local clipboard = vim.fn.getreg('+')
	local clipboard_type = vim.fn.getregtype('+')
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, true, true), 'n', true)
	vim.cmd([[normal! dd]])
	vim.fn.setreg('+', clipboard, clipboard_type)
end, opts)

keymap('x', '<Del>', function()
	local clipboard = vim.fn.getreg('+')
	local clipboard_type = vim.fn.getregtype('+')
	vim.cmd([[normal! '_d]])
	vim.fn.setreg('+', clipboard, clipboard_type)
end, opts)

local config_dir = vim.fn.stdpath('config') .. '/lua/settings/'
local files = vim.fn.glob(config_dir .. '*.lua', false, true)
for _, file in ipairs(files) do
	local relative_path = string.sub(file, #config_dir + 1, -5)
	require('settings.' .. relative_path)
end
vim.api.nvim_create_user_command('Format', function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			['end'] = { args.line2, end_line:len() },
		}
	end
	require('conform').format({ async = true, lsp_format = 'fallback', range = range })
end, { range = true })
