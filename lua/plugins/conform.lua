return {
    'stevearc/conform.nvim',
    lazy = false,
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
        {
            -- Customize or remove this keymap to your liking
            '<C-f>',
            function()
                require('conform').format({ async = true })
            end,
            mode = '',
            desc = 'Format buffer',
        },
    },
    opts = {
        formatters_by_ft = {
            lua = { 'stylua' },
            python = { 'black' },
            rust = { 'rustfmt', lsp_format = 'fallback' },
            javascript = { 'prettier' },
            cpp = { 'clang-format' },
            c = { 'clang-format' },
            html = { 'prettier' },
            css = { 'prettier' },
            json = { 'prettier' },
            typescript = { 'prettier' },
            typescriptreact = { 'prettier' },
            javascriptreact = { 'prettier' },
            markdown = { 'prettier' },
            yaml = { 'prettier' },
        },
    },
}
