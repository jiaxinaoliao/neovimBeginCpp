local status, db = pcall(require, 'dashboard')
if not status then
    vim.notify('没有找到 dashboard')
    return
end

db.custom_footer = {
    '',
    '',
    'https://github.com/jiaxinaoliao',
}

db.custom_center = {
    {
        icon = '      ',
        desc = 'Find file                           ',
        action = 'Telescope live_grep',
    },
    -- {
    --   icon = "  ",
    --   desc = "Projects                            ",
    --   action = "Telescope projects",
    -- },
    -- {
    --   icon = "  ",
    --   desc = "Recently files                      ",
    --   action = "Telescope oldfiles",
    -- },
    {
        icon = '      ',
        desc = 'Edit keybindings                    ',
        action = 'edit ~/.config/nvim/lua/keybindings.lua',
    },
    -- {
    --   icon = "  ",
    --   desc = "Edit Projects                       ",
    --   action = "edit ~/.local/share/nvim/project_nvim/project_history",
    -- },
    {
        icon = '      ',
        desc = 'Edit .zshrc                     ',
        action = 'edit ~/.zshrc',
    },
    {
        icon = '      ',
        desc = 'Change colorscheme                  ',
        action = ':ColorScheme',
    },
    -- {
    --   icon = "  ",
    --   desc = "Edit init.lua                       ",
    --   action = "edit ~/.config/nvim/init.lua",
    -- },
    -- {
    --   icon = "  ",
    --   desc = "Find text                           ",
    --   action = "Telescopecope live_grep",
    -- },
}
db.custom_header = {
    [[]],
    [[███╗   ██╗███████╗██╗  ██╗███████╗███╗   ██╗]],
    [[████╗  ██║██╔════╝██║  ██║██╔════╝████╗  ██║]],
    [[██╔██╗ ██║███████╗███████║█████╗  ██╔██╗ ██║]],
    [[██║╚██╗██║╚════██║██╔══██║██╔══╝  ██║╚██╗██║]],
    [[██║ ╚████║███████║██║  ██║███████╗██║ ╚████║]],
    [[╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝]],
}

db.custom_header = {
    [[]],
    [[          ▀████▀▄▄              ▄█ ]],
    [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
    [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
    [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
    [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
    [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
    [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
    [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
    [[   █   █  █      ▄▄           ▄▀   ]],
}

db.custom_header = {
    [[]],
    [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
    [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
    [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
    [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
    [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
    [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
    [[                                                   ]],
    [[                [ version : 1.0.0 ]                ]],
}

db.custom_header = {
    [[]],
    [[                                                  ]],
    [[       ██╗██╗ █████╗        █████╗  ██████╗     ]],
    [[       ██║██║██╔══██╗      ██╔══██╗██╔═══██╗    ]],
    [[       ██║██║███████║      ███████║██║   ██║    ]],
    [[  ██   ██║██║██╔══██║      ██╔══██║██║   ██║    ]],
    [[  ╚█████╔╝██║██║  ██║      ██║  ██║╚██████╔╝    ]],
    [[   ╚════╝ ╚═╝╚═╝  ╚═╝      ╚═╝  ╚═╝ ╚═════╝     ]],
    [[                                                  ]],
    [[                 [ version : 1.0.0 ]              ]],
}
