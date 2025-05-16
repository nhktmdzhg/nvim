---@diagnostic disable: undefined-global
-- Coc global config
vim.g.coc_global_extensions = {
    "coc-css",
    "coc-html",
    "coc-json",
    "coc-jedi",
}

-- Coc config
vim.opt.encoding = "utf-8"
vim.opt.updatetime = 300
vim.opt.signcolumn = "yes"

function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- <TAB> completion
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
vim.keymap.set('i', '<TAB>', 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
    opts)

-- <CR> completion
vim.keymap.set('i', '<cr>', [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- refresh keybinding
if vim.fn.has("nvim") == 1 then
    vim.keymap.set("i", "<C-space>", function()
        return vim.fn["coc#refresh"]()
    end, { expr = true, silent = true })
else
    vim.keymap.set("i", "<C-@>", function()
        return vim.fn["coc#refresh"]()
    end, { expr = true, silent = true })
end

-- Move between errors
vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })

-- Goto
vim.keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true })
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", { silent = true })
vim.keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true })

-- Show documentation
vim.keymap.set("n", "K", function()
    if vim.fn.CocAction("hasProvider", "hover") then
        vim.fn.CocActionAsync("doHover")
    else
        vim.api.nvim_feedkeys("K", "in", false)
    end
end, { silent = true })

-- Auto highlight
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.fn.CocActionAsync("highlight")
    end,
})

-- Rename
vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })

-- Format
vim.keymap.set("x", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })
vim.keymap.set("n", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })

-- Formatexpr cho typescript/json
vim.api.nvim_create_autocmd("FileType", {
    pattern = "typescript,json",
    callback = function()
        vim.opt_local.formatexpr = "CocAction('formatSelected')"
    end,
})

-- Show signature help khi jump placeholder
vim.api.nvim_create_autocmd("User", {
    pattern = "CocJumpPlaceholder",
    callback = function()
        vim.fn.CocActionAsync("showSignatureHelp")
    end,
})

-- Code actions
vim.keymap.set("x", "<leader>a", "<Plug>(coc-codeaction-selected)", { silent = true })
vim.keymap.set("n", "<leader>a", "<Plug>(coc-codeaction-selected)", { silent = true })

vim.keymap.set("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", { silent = true })
vim.keymap.set("n", "<leader>as", "<Plug>(coc-codeaction-source)", { silent = true })
vim.keymap.set("n", "<leader>qf", "<Plug>(coc-fix-current)", { silent = true })

-- Refactor
vim.keymap.set("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true })
vim.keymap.set("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
vim.keymap.set("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })

-- CodeLens
vim.keymap.set("n", "<leader>cl", "<Plug>(coc-codelens-action)", { silent = true })

-- Custom commands
vim.api.nvim_create_user_command("Format", function()
    vim.fn.CocActionAsync("format")
end, {})

vim.api.nvim_create_user_command("Fold", function(opts)
    vim.fn.CocAction("fold", opts.fargs)
end, { nargs = "?" })

vim.api.nvim_create_user_command("OR", function()
    vim.fn.CocActionAsync("runCommand", "editor.action.organizeImport")
end, {})

-- Add to statusline
vim.opt.statusline = "%{coc#status()}%{get(b:,'coc_current_function','')}"
