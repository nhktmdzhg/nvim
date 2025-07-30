---@diagnostic disable: undefined-global
return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
    },
    config = function()
        local cmp = require('cmp')

        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.fn['vsnip#anonymous'](args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<Tab>'] = cmp.mapping.select_next_item(),
                ['<S-Tab>'] = cmp.mapping.select_prev_item(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'vsnip' },
            }, {
                { name = 'buffer' },
            }),
            completion = {
                autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged },
                completeopt = 'menu,menuone,noselect',
            },
        })

        -- Autocomplete trong cmdline
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' },
            },
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' },
            }, {
                { name = 'cmdline' },
            }),
            matching = { disallow_symbol_nonprefix_matching = false },
        })
    end,
}
