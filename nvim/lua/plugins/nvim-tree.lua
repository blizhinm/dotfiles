local screen_util = require("util.screen")

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local nvimtree = require("nvim-tree")
    local sizes = screen_util.get_window_sizes_by_ratios({ w = 0.7, h = 0.9 })

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")

        local function opts(desc)
          return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
          }
        end

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
        vim.keymap.set(
          "n",
          "<C-t>",
          api.node.open.vertical,
          opts("Open: Vertical Split")
        )
      end,
      view = {
        -- float = {
        -- 	enable = true,
        -- 	open_win_config = function()
        -- 		return {
        -- 			border = "rounded",
        -- 			relative = "editor",
        -- 			row = sizes.row,
        -- 			col = sizes.col,
        -- 			width = sizes.width,
        -- 			height = sizes.height,
        -- 		}
        -- 	end,
        -- },
        width = 40,
        relativenumber = true,
      },
      modified = {
        enable = true,
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      actions = {
        open_file = {
          quit_on_open = false,
          eject = false,
          resize_window = true,
          -- window_picker = {
          -- 	enable = false,
          -- },
        },
      },
      git = {
        ignore = false,
      },
      update_focused_file = {
        enable = true,
        -- update_root = true,
      },
    })

    -- set keymaps
    local keymap = vim.keymap

    keymap.set(
      "n",
      "<leader>ee",
      "<cmd>NvimTreeToggle<CR>",
      { desc = "Toggle file explorer" }
    )
    keymap.set(
      "n",
      "<leader>ef",
      "<cmd>NvimTreeFindFile!<bar>NvimTreeFocus<CR>",
      { desc = "Focus file explorer on current file" }
    )
    keymap.set(
      "n",
      "<leader>ec",
      "<cmd>NvimTreeCollapseKeepBuffers<CR>",
      { desc = "Collapse file explorer except buffers" }
    )
    keymap.set(
      "n",
      "<leader>eC",
      "<cmd>NvimTreeCollapse<CR>",
      { desc = "Collapse file explorer" }
    )
    keymap.set(
      "n",
      "<leader>er",
      "<cmd>NvimTreeRefresh<CR>",
      { desc = "Refresh file explorer" }
    )
  end,
}
