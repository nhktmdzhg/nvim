return {
    'OXY2DEV/markview.nvim',
    lazy = true,
    keys = {
        { '<C-S-p>', ':Markview Toggle<CR>', mode = { 'n', 'v', 'i' }, desc = 'Toggle Markview' },
    },
    ft = { 'markdown', 'latex', 'html' },
    priority = 49,
    opts = {
        preview = {
            icon_provider = 'devicons',
        }
    }
}
