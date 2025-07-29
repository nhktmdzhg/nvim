local wilder = require('wilder')

wilder.setup({
    modes = { ":" },
    next_key = "<Down>",
    previous_key = "<Up>",
    accept_key = "<Tab>",
    reject_key = "<S-Tab>"
})

wilder.set_option("renderer", wilder.popupmenu_renderer({
    pumblend = 20,
    max_height = "75%",                       -- Limit popup height
    min_width = "100%",                       -- Full width popup
    reverse = 0,                              -- Search from top to bottom
    highlighter = wilder.basic_highlighter(), -- Use basic highlighter for performance
    left = { " ", wilder.popupmenu_devicons() },
    right = { " ", wilder.popupmenu_scrollbar() },
}))
