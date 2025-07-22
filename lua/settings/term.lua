---@diagnostic disable: undefined-global
-- Vim opt
local term = require("toggleterm")
term.setup({
    size = 20,
    open_mapping = nil,  -- Disable default mapping to avoid conflicts
    hide_numbers = true, -- Hide line numbers in terminal
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = '1',     -- Degree of darken terminal color
    start_in_insert = true,   -- Start terminal in insert mode
    insert_mappings = true,   -- Apply mappings in insert mode
    terminal_mappings = true, -- Apply mappings in terminal mode
    persist_size = true,
    persist_mode = true,      -- Remember last terminal mode
    direction = 'float',
    close_on_exit = true,     -- Close terminal when process exits
    shell = vim.o.shell,      -- Use default shell
    auto_scroll = true,       -- Auto scroll to bottom on terminal output
    float_opts = {
        border = 'curved',
        width = function()
            return math.floor(vim.o.columns * 0.8)
        end,
        height = function()
            return math.floor(vim.o.lines * 0.8)
        end,
        winblend = 3,
    },
})

local key = vim.keymap.set
local opts = {
    noremap = true,
    silent = true
}
key("n", "<F9>", ":ToggleTerm direction=float<CR>", opts)
key('t', '<esc>', [[<C-\><C-n>]], opts)
for i = 1, 10 do
    key("n", "<C-" .. i .. ">", ":TermSelect<CR>" .. i .. "<CR><CR", opts)
end
key("n", "<C-k>", ":bd!<CR>", opts)
