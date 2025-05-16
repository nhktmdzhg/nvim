---@diagnostic disable: undefined-global
-- Vim opt
local term = require("toggleterm")
term.setup()
local key = vim.keymap.set
local opts = { noremap = true, silent = true }
key("n", "<F9>", ":ToggleTerm direction=float<CR>", opts)
key('t', '<esc>', [[<C-\><C-n>]], opts)
for i = 1, 10 do
  key("n", "<C-" .. i .. ">", ":TermSelect<CR>" .. i .. "<CR><CR", opts)
end
key("n", "<C-k>", ":bd!<CR>", opts)
