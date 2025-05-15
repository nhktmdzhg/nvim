---@diagnostic disable: undefined-global
-- Extra key bindings for fzf
vim.g.fzf_action = {
  ["ctrl-t"] = "tab split",
  ["ctrl-x"] = "split",
  ["ctrl-v"] = "vsplit"
}

-- Layout of FZF window
vim.g.fzf_layout = {
  window = {
    width = 0.8,
    height = 0.5,
    highlight = "Comment"
  }
}

-- Preview window layout
vim.g.fzf_preview_window = { "right:50%", "ctrl-/" }

-- Git commit log format
vim.g.fzf_commits_log_options = "--graph --color=always --format=\"%C(auto)%h%d %s %C(black)%C(bold)%cr\""

-- Highlight definitions
vim.api.nvim_set_hl(0, "fzf_fg", { ctermfg = 14 })
vim.api.nvim_set_hl(0, "fzf_fgp", { ctermfg = 3 })
vim.api.nvim_set_hl(0, "fzf_hl", { ctermfg = 5 })
vim.api.nvim_set_hl(0, "fzf_hlp", { ctermfg = 5 })
vim.api.nvim_set_hl(0, "fzf_info", { ctermfg = 6 })
vim.api.nvim_set_hl(0, "fzf_prompt", { ctermfg = 6 })
vim.api.nvim_set_hl(0, "fzf_spinner", { ctermfg = 6 })
vim.api.nvim_set_hl(0, "fzf_pointer", { ctermfg = 3 })

-- Color mapping for FZF
vim.g.fzf_colors = {
  fg      = { "fg", "fzf_fg" },
  hl      = { "fg", "fzf_hl" },
  fg_plus = { "fg", "fzf_fgp" },
  hl_plus = { "fg", "fzf_hlp" },
  info    = { "fg", "fzf_info" },
  prompt  = { "fg", "fzf_prompt" },
  pointer = { "fg", "fzf_pointer" },
  spinner = { "fg", "fzf_spinner" }
}

-- Custom commands
local fzf = require("fzf-lua")
vim.api.nvim_create_user_command("Files", function(opts)
  local args = opts.fargs or {}
  local cwd = opts.args or nil

  fzf.files({
    cwd            = cwd,
    search_preview = true,
    winopts        = {
      height  = 0.5,
      width   = 0.8,
      preview = { vertical = "down:50%" }
    },
    fzf_opts       = {
      ["--layout"] = "reverse",
      ["--info"]   = "inline"
    }
  })
end, {
  nargs = "?",
  bang = true,
  complete = "dir"
})

vim.api.nvim_create_user_command("Rg", function(opts)
  local query = table.concat(opts.fargs, " ")
  fzf.grep({
    search = query,
    fzf_opts = {
      ["--exact"]  = "",
      ["--layout"] = "reverse"
    }
  })
end, {
  nargs = "*",
  bang = true
})

-- Key mappings
vim.keymap.set("n", "<F6>", ":Files<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<F7>", ":Rg<CR>", { silent = true, noremap = true })

-- Remove __pycache__ and .git from search results
vim.env.FZF_DEFAULT_COMMAND = [[find . $ -name __pycache__ -o -name .git -o -name .vagrant -prune -o -print]]
