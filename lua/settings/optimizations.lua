---@diagnostic disable: undefined-global
-- Performance and utility optimizations

-- Auto-save functionality (non-intrusive)
local auto_save_group = vim.api.nvim_create_augroup('AutoSave', { clear = true })

-- Auto-save when focus is lost or switching buffers
vim.api.nvim_create_autocmd({ 'FocusLost', 'BufLeave' }, {
	group = auto_save_group,
	pattern = '*',
	callback = function()
		-- Only save if buffer is modifiable and has a filename
		if vim.bo.modifiable and vim.bo.buftype == '' and vim.fn.expand('%') ~= '' then
			vim.cmd('silent! wall') -- Save all buffers silently
		end
	end,
})

-- Auto-save periodically (every 10 seconds when idle)
vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
	group = auto_save_group,
	pattern = '*',
	callback = function()
		if vim.bo.modifiable and vim.bo.buftype == '' and vim.fn.expand('%') ~= '' and vim.bo.modified then
			vim.cmd('silent! write')
		end
	end,
})

-- Better startup performance
vim.api.nvim_create_autocmd('VimEnter', {
	callback = function()
		-- Disable some built-in plugins for better startup time
		local disabled_built_ins = {
			'netrw',
			'netrwPlugin',
			'netrwSettings',
			'netrwFileHandlers',
			'gzip',
			'zip',
			'zipPlugin',
			'tar',
			'tarPlugin',
			'getscript',
			'getscriptPlugin',
			'vimball',
			'vimballPlugin',
			'2html_plugin',
			'logipat',
			'rrhelper',
			'spellfile_plugin',
			'matchit',
		}

		for _, plugin in pairs(disabled_built_ins) do
			vim.g['loaded_' .. plugin] = 1
		end
	end,
})

-- Better completion behavior
vim.opt.completeopt = 'menu,menuone,noselect,preview'
vim.opt.pumheight = 15 -- Limit popup menu height
vim.opt.pumblend = 10  -- Make popup menu slightly transparent

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
vim.opt.formatoptions = 'jcroqlnt' -- Better auto-formatting
vim.opt.textwidth = 0              -- No automatic line wrapping

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
