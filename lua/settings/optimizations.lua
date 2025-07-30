---@diagnostic disable: undefined-global
-- Better completion behavior
vim.opt.completeopt = 'menu,menuone,noselect,preview'
vim.opt.pumheight = 15 -- Limit popup menu height
vim.opt.pumblend = 10 -- Make popup menu slightly transparent

-- Better cursor behavior
vim.opt.guicursor =
	'n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175'

-- Improve large file handling
local large_file_group = vim.api.nvim_create_augroup('LargeFile', { clear = true })
vim.api.nvim_create_autocmd('BufReadPre', {
	group = large_file_group,
	pattern = '*',
	callback = function()
		local file_size = vim.fn.getfsize(vim.fn.expand('<afile>'))
		-- If file is larger than 1MB, optimize for performance
		if file_size > 1048576 then
			vim.opt_local.foldmethod = 'manual'
			vim.opt_local.syntax = 'off'
			vim.opt_local.wrap = false
			vim.opt_local.number = false
			vim.opt_local.relativenumber = false
			vim.opt_local.cursorline = false
			vim.opt_local.cursorcolumn = false
			vim.opt_local.colorcolumn = ''
		end
	end,
})

-- Better session management
vim.opt.sessionoptions = 'buffers,curdir,folds,help,tabpages,winsize,winpos,terminal'

-- Better diff options
vim.opt.diffopt = 'internal,filler,closeoff,hiddenoff,algorithm:histogram'

-- Improve memory usage
vim.opt.maxmempattern = 5000
vim.opt.synmaxcol = 3000

-- Better wildmenu
vim.opt.wildmenu = true
vim.opt.wildmode = 'longest:full,full'
vim.opt.wildoptions = 'pum,tagfile'

-- Better text formatting
vim.opt.formatoptions = 'jqlnt' -- Better auto-formatting
vim.opt.textwidth = 0 -- No automatic line wrapping

-- Optimize screen updates
vim.opt.ttyfast = true -- Faster terminal connection
vim.opt.laststatus = 3 -- Global statusline (better with lualine globalstatus)

-- Better error handling for missing directories
vim.api.nvim_create_autocmd('BufWritePre', {
	callback = function()
		local dir = vim.fn.expand('<afile>:p:h')
		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, 'p')
		end
	end,
})
