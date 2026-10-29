
return {
  {
    "nvim-telescope/telescope.nvim",
    version = "*",

    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },

    cmd = "Telescope",

    keys = {
      {
        "<leader>ff",
        "<cmd>Telescope find_files<CR>",
        desc = "Buscar archivos",
      },
      {
        "<leader>fg",
        "<cmd>Telescope live_grep<CR>",
        desc = "Buscar texto",
      },
      {
        "<leader>fb",
        "<cmd>Telescope buffers<CR>",
        desc = "Buffers abiertos",
      },
    },

    opts = {},
  },
}

