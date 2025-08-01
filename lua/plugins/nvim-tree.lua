---@diagnostic disable: undefined-global
local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5
local function natural_cmp(left, right)
	left = left.name:lower()
	right = right.name:lower()

	if left == right then
		return false
	end

	for i = 1, math.max(string.len(left), string.len(right)), 1 do
		local l = string.sub(left, i, -1)
		local r = string.sub(right, i, -1)

		if type(tonumber(string.sub(l, 1, 1))) == 'number' and type(tonumber(string.sub(r, 1, 1))) == 'number' then
			local l_number = tonumber(string.match(l, '^[0-9]+'))
			local r_number = tonumber(string.match(r, '^[0-9]+'))

			if l_number ~= r_number then
				return l_number < r_number
			end
		elseif string.sub(l, 1, 1) ~= string.sub(r, 1, 1) then
			return l < r
		end
	end
end
return {
	'nvim-tree/nvim-tree.lua',
	lazy = true,
	keys = {
		{
			'<F5>',
			function()
				require('nvim-tree.api').tree.toggle()
			end,
			desc = 'Toggle Nvim Tree',
		},
		{
			'<F6>',
			function()
				require('nvim-tree.api').tree.reload()
			end,
			desc = 'Reload Nvim Tree',
		},
	},
	config = function()
		require('nvim-tree').setup({
			sort = {
				sorter = 'case_sensitive',
			},
			view = {
				float = {
					enable = true,
					open_win_config = function()
						local screen_w = vim.opt.columns:get()
						local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
						local window_w = screen_w * WIDTH_RATIO
						local window_h = screen_h * HEIGHT_RATIO
						local window_w_int = math.floor(window_w)
						local window_h_int = math.floor(window_h)
						local center_x = (screen_w - window_w) / 2
						local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
						return {
							border = 'rounded',
							relative = 'editor',
							row = center_y,
							col = center_x,
							width = window_w_int,
							height = window_h_int,
						}
					end,
				},
				width = function()
					return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
				end,
			},
			renderer = {
				group_empty = true,
				highlight_git = true, -- Enable git highlighting
				highlight_opened_files = 'name', -- Highlight opened files
				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
					glyphs = {
						default = '',
						symlink = '',
						git = {
							unstaged = '✗',
							staged = '✓',
							unmerged = '',
							renamed = '➜',
							untracked = '★',
							deleted = '',
							ignored = '◌',
						},
					},
				},
			},
			git = {
				enable = true,
				ignore = true,
				show_on_dirs = true,
				timeout = 400,
			},
			filters = {
				dotfiles = true,
				custom = { '^.git$', 'node_modules', '.cache' },
				exclude = { '.gitignore', '.env.example' },
			},
			filesystem_watchers = {
				enable = true,
				debounce_delay = 50,
				ignore_dirs = {
					'node_modules',
					'.git',
					'.cache',
					'target',
					'build',
					'dist',
				},
			},
			actions = {
				open_file = {
					quit_on_open = false, -- Don't close tree when opening file
					resize_window = true, -- Resize window after opening file
					window_picker = {
						enable = true,
						chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
						exclude = {
							filetype = { 'notify', 'packer', 'qf', 'diff', 'fugitive', 'fugitiveblame' },
							buftype = { 'nofile', 'terminal', 'help' },
						},
					},
				},
				change_dir = {
					enable = true, -- Change root directory
					global = false, -- Change only current window's directory
					restrict_above_cwd = false,
				},
			},
			sort_by = function(nodes)
				table.sort(nodes, natural_cmp)
			end,
		})
		local api = require('nvim-tree.api')
		vim.api.nvim_create_autocmd({ 'BufEnter', 'QuitPre' }, {
			nested = false,
			callback = function(e)
				local tree_api = api.tree
				if not tree_api.is_visible() then
					return
				end
				local winCount = 0
				for _, winId in ipairs(vim.api.nvim_list_wins()) do
					if vim.api.nvim_win_get_config(winId).focusable then
						winCount = winCount + 1
					end
				end
				if e.event == 'QuitPre' and winCount == 2 then
					vim.api.nvim_cmd({
						cmd = 'qall',
					}, {})
				end
				if e.event == 'BufEnter' and winCount == 1 then
					vim.defer_fn(function()
						tree_api.toggle({
							find_file = true,
							focus = true,
						})
						tree_api.toggle({
							find_file = true,
							focus = false,
						})
					end, 10)
				end
			end,
		})
	end,
}
