---@diagnostic disable: undefined-global
vim.g.floaterm_position = "topright"
vim.g.floaterm_width = 0.8
vim.g.floaterm_height = 0.8
vim.g.floaterm_title = "PEAKKKKKKKKK"
vim.g.floaterm_titleposition = "center"
vim.g.floaterm_wintype = "float"
vim.g.floaterm_rootmarkers = { ".pro" }
vim.g.floaterm_borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

vim.cmd([[
  hi Floaterm guibg=Grey15
  hi FloatermBorder guifg=Orange guibg=DarkGreen
  hi FloatermNC guibg=darkred
]])

local keymap = vim.keymap.set
local opts = { silent = true, noremap = true }

-- Open floaterm
keymap("n", "<F9>", ":FloatermNew<CR>", opts)
keymap("t", "<F9>", "<C-\\><C-n>:FloatermNew zsh<CR>", opts)

-- Toggle terminal
keymap("n", "<F10>", ":FloatermToggle<CR>", opts)
keymap("t", "<F10>", "<C-\\><C-n>:FloatermToggle<CR>", opts)
