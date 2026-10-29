return {
  {
    "goolord/alpha-nvim",

    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- ASCII art del encabezado
      dashboard.section.header.val = {
        [[         █████                ███████████                                ]],
        [[        ███░░░███             ░░███░░░░░███                              ]],
        [[       ███   ░░███ █████ █████ ░███    ░███ █████ ████ ████████   ██████ ]],
        [[      ░███    ░███░░███ ░░███  ░██████████ ░░███ ░███ ░░███░░███ ███░░███]],
        [[      ░███    ░███ ░░░█████░   ░███░░░░░░   ░███ ░███  ░███ ░░░ ░███ ░███]],
        [[      ░░███   ███   ███░░░███  ░███         ░███ ░███  ░███     ░███ ░███]],
        [[       ░░░█████░   █████ █████ █████        ░░███████  █████    ░░██████ ]],
        [[         ░░░░░░   ░░░░░ ░░░░░ ░░░░░          ░░░░░███ ░░░░░      ░░░░░░  ]],
        [[                                             ███ ░███                    ]],
        [[                                            ░░██████                     ]],
        [[                                             ░░░░░░                      ]],
      }

      -- Color del encabezado
      dashboard.section.header.opts.hl = "Title"

      -- Frase de Spider-Man al pie del dashboard
dashboard.section.footer.val = {
    "",
    '"With great power comes great responsibility."',
}

dashboard.section.footer.opts.hl = "Comment"

      -- Inicializar dashboard
      alpha.setup(dashboard.config)
    end,
  },
}

