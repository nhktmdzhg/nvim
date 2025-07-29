---@diagnostic disable: undefined-global
-- Vim opt
vim.opt.mouse = "a"
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.list = true
vim.opt.foldmethod = "syntax"
vim.opt.foldnestmax = 1
vim.opt.foldlevelstart = 3
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.synmaxcol = 3000
vim.opt.lazyredraw = true
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true

-- Performance optimizations
vim.opt.hidden = true        -- Allow switching buffers without saving
vim.opt.wrap = false         -- Disable line wrapping for better performance
vim.opt.conceallevel = 0     -- Show concealed text
vim.opt.scrolloff = 8        -- Keep 8 lines visible above/below cursor
vim.opt.sidescrolloff = 8    -- Keep 8 columns visible left/right of cursor
vim.opt.updatetime = 100     -- Faster completion (default is 4000ms)
vim.opt.timeoutlen = 500     -- Faster key sequence completion
vim.opt.redrawtime = 1500    -- Time limit for redrawing
vim.opt.maxmempattern = 5000 -- Memory limit for pattern matching
vim.opt.re = 0               -- Use automatic regexp engine selection

-- Better splitting
vim.opt.splitbelow = true -- New horizontal splits go below
vim.opt.splitright = true -- New vertical splits go right

-- Improve search
vim.opt.hlsearch = true  -- Highlight search results
vim.opt.incsearch = true -- Incremental search
vim.opt.smartcase = true -- Smart case sensitivity (with ignorecase)

-- Better indentation
vim.opt.smartindent = true -- Smart autoindenting
vim.opt.autoindent = true  -- Copy indent from current line

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.json",
    callback = function()
        vim.opt.foldmethod = "indent"
    end
})

vim.cmd("syntax on")

local function should_checktime()
    local current_mode = vim.api.nvim_get_mode().mode
    local cmd_type = vim.v.event == nil and "" or vim.fn.getcmdwintype()
    return not vim.tbl_contains({ "c", "r", "r?", "!", "t" }, current_mode) and cmd_type == ""
end

local checktime_group = vim.api.nvim_create_augroup("CheckTimeAutoReload", {
    clear = true
})

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    group = checktime_group,
    pattern = "*",
    callback = function()
        if should_checktime() then
            vim.cmd("checktime")
        end
    end
})

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
    group = checktime_group,
    pattern = "*",
    callback = function()
        if should_checktime() then
            vim.cmd("checktime")
        end
    end
})

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin', vim.fn.stdpath('config') .. '/plugged')

-- Theme
Plug('catppuccin/nvim', {
    ["as"] = 'catppuccin'
})
Plug('akinsho/bufferline.nvim', {
    ["tag"] = "*"
})

-- File explorer
Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-tree/nvim-tree.lua')

-- wilder.nvim
if vim.fn.has('nvim') == 1 then
    function UpdateRemotePlugins(...)
        local rtp = vim.opt.runtimepath:get()
        vim.opt.runtimepath:prepend(rtp)
        vim.cmd("UpdateRemotePlugins")
    end

    Plug('gelguy/wilder.nvim', {
        ["do"] = function(...)
            UpdateRemotePlugins(...)
        end
    })
else
    Plug('gelguy/wilder.nvim')
end

-- File search
Plug('junegunn/fzf', {
    ["do"] = function()
        return vim.fn['fzf#install']()
    end
})
Plug('ibhagwan/fzf-lua')

-- Status bar
Plug('nvim-lualine/lualine.nvim')

-- Terminal
Plug('akinsho/toggleterm.nvim', {
    ['tag'] = '*'
})

-- Code intellisense
Plug('neoclide/coc.nvim', {
    branch = 'release'
})
Plug('windwp/nvim-autopairs')
Plug('mattn/emmet-vim')
Plug('preservim/nerdcommenter')

-- Code syntax highlight
Plug('jackguo380/vim-lsp-cxx-highlight') -- C/C++
Plug('sheerun/vim-polyglot')             -- Multi-language
Plug('yuezk/vim-js')                     -- JavaScript
Plug('MaxMEllon/vim-jsx-pretty')         -- JSX

-- Git
Plug('tpope/vim-fugitive')      -- Git info
Plug('tpope/vim-rhubarb')
Plug('airblade/vim-gitgutter')  -- Git diff
Plug('samoshkin/vim-mergetool') -- Merge tool

-- Fold
Plug('tmhedberg/SimpylFold')

-- Github Copilot
Plug('github/copilot.vim')

-- Greeter
Plug('echasnovski/mini.icons', {
    ["branch"] = "stable"
})
Plug('goolord/alpha-nvim')

vim.call('plug#end')
require("nvim-autopairs").setup {}
require('mini.icons').setup()
require 'alpha'.setup(require 'alpha.themes.dashboard'.config)

local wilder = require('wilder')

wilder.setup({
    modes = { ":", "/", "?" },
    next_key = "<Down>",
    previous_key = "<Up>",
    accept_key = "<Tab>",
    reject_key = "<S-Tab>"
})

wilder.set_option("renderer", wilder.popupmenu_renderer({
    pumblend = 20,
    max_height = "75%",                       -- Limit popup height
    min_width = "100%",                       -- Full width popup
    reverse = 0,                              -- Search from top to bottom
    highlighter = wilder.basic_highlighter(), -- Use basic highlighter for performance
    left = { " ", wilder.popupmenu_devicons() },
    right = { " ", wilder.popupmenu_scrollbar() },
}))

vim.cmd.colorscheme "catppuccin-mocha"
require("bufferline").setup {
    options = {
        indicator = {
            style = 'none'
        },
        diagnostics = "coc",
        diagnostics_update_in_insert = false, -- Don't update diagnostics in insert mode
        show_buffer_icons = true,
        show_buffer_close_icons = false,      -- Disable close icons for cleaner look
        show_close_icon = false,              -- Disable global close icon
        show_tab_indicators = true,
        persist_buffer_sort = true,           -- Remember buffer order
        separator_style = "thin",             -- Thin separators for less visual noise
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        sort_by = 'insert_after_current', -- New buffers after current
        custom_filter = function(buf_number, buf_numbers)
            -- Hide terminal buffers from bufferline
            if vim.bo[buf_number].filetype == "toggleterm" then
                return false
            end
            return true
        end,
        offsets = {
            {
                filetype = "NvimTree",
                text = " File Explorer",
                text_align = "center",
                separator = true
            }
        },
    }
}

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o"
})

local keymap = vim.keymap.set
local opts = {
    noremap = true,
    silent = true
}

keymap("n", "/\\", ":noh<CR>", opts)
keymap("n", "<leader>bd", ":bp <bar> sp <bar> bn <bar> bd<CR>", opts)
keymap("n", "<C-a>", "gg<S-v>G", opts)
keymap("i", "<C-a>", "<Esc>gg<S-v>G", opts)
keymap("n", "<C-Tab>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<C-S-w>", ":bdelete<CR>", opts)
keymap("n", "<C-S>", ":write<CR>", opts)
keymap("i", "<C-S>", "<Esc>:write<CR>a", opts)
keymap("n", "<S-Del>", function()
    local clipboard = vim.fn.getreg("+")
    local clipboard_type = vim.fn.getregtype("+")
    vim.cmd([[normal! dd]])
    vim.fn.setreg("+", clipboard, clipboard_type)
end, opts)

keymap("i", "<S-Del>", function()
    local clipboard = vim.fn.getreg("+")
    local clipboard_type = vim.fn.getregtype("+")
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, true, true), "n", true)
    vim.cmd([[normal! dd]])
    vim.fn.setreg("+", clipboard, clipboard_type)
end, opts)

keymap("x", "<Del>", function()
    local clipboard = vim.fn.getreg("+")
    local clipboard_type = vim.fn.getregtype("+")
    vim.cmd([[normal! "_d]])
    vim.fn.setreg("+", clipboard, clipboard_type)
end, opts)

local config_dir = vim.fn.stdpath("config") .. "/lua/settings/"
local files = vim.fn.glob(config_dir .. "*.lua", false, true)
for _, file in ipairs(files) do
    local relative_path = string.sub(file, #config_dir + 1, -5)
    require("settings." .. relative_path)
end
