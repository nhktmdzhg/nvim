---@diagnostic disable: undefined-global
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Launch debugger
keymap("n", "<Leader>dl", ":call vimspector#Launch()<CR>", opts)

-- Reset debugger
keymap("n", "<Leader>ds", ":call vimspector#Reset()<CR>", opts)

-- Continue / Resume execution
keymap("n", "<Leader>dc", ":call vimspector#Continue()<CR>", opts)

-- Toggle breakpoint
keymap("n", "<Leader>dt", ":call vimspector#ToggleBreakpoint()<CR>", opts)

-- Clear all breakpoints
keymap("n", "<Leader>dT", ":call vimspector#ClearBreakpoints()<CR>", opts)

-- Restart debugging session (mapped from <Plug>)
keymap("n", "<Leader>dr", "<Plug>VimspectorRestart", opts)

-- Step Out
keymap("n", "<Leader>de", "<Plug>VimspectorStepOut", opts)

-- Step Into
keymap("n", "<Leader>di", "<Plug>VimspectorStepInto", opts)

-- Step Over
keymap("n", "<Leader>do", "<Plug>VimspectorStepOver", opts)
