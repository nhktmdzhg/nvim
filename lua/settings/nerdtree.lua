---@diagnostic disable: undefined-global
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<F5>", ":NERDTreeToggle<CR>", opts)
keymap("n", "<F4>", ":NERDTree<CR>", opts)

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    local tabpages = vim.fn.tabpagenr("$")
    local wins = vim.fn.winnr("$")
    if tabpages == 1 and wins == 1 then
      local bufname = vim.api.nvim_buf_get_name(0)
      if bufname:match("NERD_tree_") then
        vim.cmd("quit")
      end
    end
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function()
    local buftype = vim.opt_local.buftype:get()
    if buftype ~= "quickfix" and vim.fn.getcmdwintype() == "" then
      vim.cmd("silent NERDTreeMirror")
    end
  end,
})

vim.g.NERDTreeDirArrowExpandable = "▸"
vim.g.NERDTreeDirArrowCollapsible = "▾"
vim.g.NERDTreeGitStatusIndicatorMapCustom = {
  Modified = "✹",
  Staged = "✚",
  Untracked = "✭",
  Renamed = "➜",
  Unmerged = "═",
  Deleted = "✖",
  Dirty = "✗",
  Ignored = "☒",
  Clean = "✔︎",
  Unknown = "?",
}
vim.g.nerdtree_sync_cursorline = 1
vim.g.NERDTreeIgnore = { "__pycache__", "site-packages" }
