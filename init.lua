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

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*.json",
    callback = function()
        vim.opt.foldmethod = "indent"
    end
})

vim.cmd("syntax on")

local function should_checktime()
    local current_mode = vim.api.nvim_get_mode().mode
    local cmd_type = vim.v.event == nil and "" or vim.fn.getcmdwintype()
    return not vim.tbl_contains({"c", "r", "r?", "!", "t"}, current_mode) and cmd_type == ""
end

local checktime_group = vim.api.nvim_create_augroup("CheckTimeAutoReload", {
    clear = true
})

vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
    group = checktime_group,
    pattern = "*",
    callback = function()
        if should_checktime() then
            vim.cmd("checktime")
        end
    end
})

vim.api.nvim_create_autocmd({"FocusGained", "BufEnter"}, {
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
Plug('sheerun/vim-polyglot') -- Multi-language
Plug('yuezk/vim-js') -- JavaScript
Plug('MaxMEllon/vim-jsx-pretty') -- JSX

-- Git
Plug('tpope/vim-fugitive') -- Git info
Plug('tpope/vim-rhubarb')
Plug('airblade/vim-gitgutter') -- Git diff
Plug('samoshkin/vim-mergetool') -- Merge tool

-- Fold
Plug('tmhedberg/SimpylFold')

-- Github Copilot
Plug('github/copilot.vim')

-- Greeter
Plug('echasnovski/mini.icons', {
    ["branch"] = "stable"
})
Plug('nhktmdzhg/alpha-nvim')

-- Input method
Plug('h-hg/fcitx.nvim')

vim.call('plug#end')
require("nvim-autopairs").setup {}
require('mini.icons').setup()
require'alpha'.setup(require'alpha.themes.dashboard'.config)

local wilder = require('wilder')

wilder.setup({
    modes = {":", "/", "?"},
    next_key = "<Down>",
    previous_key = "<Up>",
    accept_key = "<Tab>",
    reject_key = "<S-Tab>"
})

wilder.set_option("renderer", wilder.popupmenu_renderer({
    pumblend = 20
}))

vim.cmd.colorscheme "catppuccin-mocha"
require("bufferline").setup {
    options = {
        indicator = {
            style = 'none'
        },
        diagnostics = "coc"
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

