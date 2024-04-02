local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("没有找到 dashboard")
  return
end

db.setup({
  theme = "doom",
  config = {
    -- week_header = {
    --   enable = true,
    -- },
    footer = {
      "",
      "",
      " https://github.com/jiaxinaoliao",
    },

    center = {
      {
        icon = "                    󰈞  ",
        icon_hl = "title",
        desc = "Find file                           ",
        desc_hl = "string",
        action = "Telescope find_files",
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
        icon = "                      ",
        icon_hl = "title",
        desc = "Edit keybindings                    ",
        desc_hl = "string",
        action = "edit ~/.config/nvim/lua/keybindings.lua",
      },
      -- {
      --   icon = "  ",
      --   desc = "Edit Projects                       ",
      --   action = "edit ~/.local/share/nvim/project_nvim/project_history",
      -- },
      {
        icon = "                      ",
        icon_hl = "title",
        desc = "Edit zsh                     ",
        desc_hl = "string",
        action = "edit ~/.zshrc",
      },
      -- {
      --   icon = '            ',
      --   desc = 'Change colorscheme                  ',
      --   action = ':ColorScheme',
      -- },
      {
        icon = "                      ",
        icon_hl = "title",
        desc = "Edit init.lua                       ",
        desc_hl = "string",
        action = "edit ~/.config/nvim/init.lua",
      },
      -- {
      --   icon = "  ",
      --   desc = "Find text                           ",
      --   action = "Telescopecope live_grep",
      -- },
    },

    header = {
      [[]],
      [[                                               ]],
      [[        ██╗██╗ █████╗        █████╗  ██████╗   ]],
      [[        ██║██║██╔══██╗      ██╔══██╗██╔═══██╗  ]],
      [[        ██║██║███████║      ███████║██║   ██║  ]],
      [[   ██   ██║██║██╔══██║      ██╔══██║██║   ██║  ]],
      [[   ╚█████╔╝██║██║  ██║      ██║  ██║╚██████╔╝  ]],
      [[    ╚════╝ ╚═╝╚═╝  ╚═╝      ╚═╝  ╚═╝ ╚═════╝   ]],
      [[                                               ]],
      [[                                               ]],
      [[               [ version : 5.2.1 ]             ]],
      [[]],
      [[]],
    },
  },
})

-- db.custom_header = {
--     [[]],
--     [[███╗   ██╗███████╗██╗  ██╗███████╗███╗   ██╗]],
--     [[████╗  ██║██╔════╝██║  ██║██╔════╝████╗  ██║]],
--     [[██╔██╗ ██║███████╗███████║█████╗  ██╔██╗ ██║]],
--     [[██║╚██╗██║╚════██║██╔══██║██╔══╝  ██║╚██╗██║]],
--     [[██║ ╚████║███████║██║  ██║███████╗██║ ╚████║]],
--     [[╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝]],
-- }
--
-- db.custom_header = {
--     [[]],
--     [[          ▀████▀▄▄              ▄█ ]],
--     [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
--     [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
--     [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
--     [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
--     [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
--     [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
--     [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
--     [[   █   █  █      ▄▄           ▄▀   ]],
-- }
--
-- db.custom_header = {
--     [[]],
--     [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
--     [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
--     [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
--     [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
--     [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
--     [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
--     [[                                                   ]],
--     [[                [ version : 1.0.0 ]                ]],
-- }
