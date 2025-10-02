return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    settings = {
      save_on_toggle = true,
    },
  },
  config = function(_, opts)
    local harpoon = require("harpoon")
    local harpoon_extensions = require("harpoon.extensions")

    harpoon.setup(opts)
    harpoon:extend(harpoon_extensions.builtins.highlight_current_file())
  end,
  keys = function()
    local keys = {
      {
        "<leader>hH",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon File",
      },
      {
        "<leader>hh",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list(), {
            border = "rounded",
            title_pos = "center",
            ui_width_ratio = 0.40,
          })
        end,
        desc = "Harpoon Quick Menu",
      },
    }

    for i = 1, 9 do
      table.insert(keys, {
        "<leader>" .. i,
        function()
          require("harpoon"):list():select(i)
        end,
        desc = "Harpoon to File " .. i,
      })
    end
    return keys
  end,
}
