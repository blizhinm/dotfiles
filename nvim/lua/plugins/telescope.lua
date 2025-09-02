return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      pickers = {
        find_files = {
          hidden = true,
        },
        grep_string = {
          additional_args = { "--hidden" },
        },
        live_grep = {
          additional_args = { "--hidden" },
        },
      },
      defaults = {
        layout_config = {
          horizontal = {
            height = 0.9,
            width = 0.9,
            preview_width = 0.5,
          },
        },
        path_display = { { tuncate = 3 } },
        mappings = {
          i = {
            ["<Up>"] = false,
            ["<Right>"] = false,
            ["<Down>"] = false,
            ["<Left>"] = false,

            ["<esc>"] = actions.close,
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist,
            ["<C-t>"] = actions.select_vertical,
            ["<M-t>"] = actions.select_tab,
          },
          n = {
            ["<Up>"] = false,
            ["<Right>"] = false,
            ["<Down>"] = false,
            ["<Left>"] = false,

            ["<C-t>"] = actions.select_vertical,
            ["<M-t>"] = actions.select_tab,
            ["d"] = actions.delete_buffer,
            ["q"] = actions.close,
          },
        },
      },
    })

    -- telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set(
      "n",
      "<leader>tx",
      require("telescope.builtin").resume,
      { desc = "Toggle telescope" }
    )
    keymap.set(
      "n",
      "<leader>tf",
      "<cmd>Telescope find_files<cr>",
      { desc = "Fuzzy find files in cwd" }
    )
    keymap.set(
      "n",
      "<leader>tb",
      "<cmd>Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal theme=ivy<cr>",
      { desc = "Fuzzy find buffers" }
    )
    keymap.set(
      "n",
      "<leader>tr",
      "<cmd>Telescope oldfiles<cr>",
      { desc = "Fuzzy find recent files" }
    )
    keymap.set(
      "n",
      "<leader>ts",
      "<cmd>Telescope live_grep<cr>",
      { desc = "Find string in cwd" }
    )
    keymap.set(
      "n",
      "<leader>tc",
      "<cmd>Telescope grep_string<cr>",
      { desc = "Find string under cursor in cwd" }
    )
    keymap.set(
      "n",
      "<leader>th",
      "<cmd>Telescope help_tags<cr>",
      { desc = "Help tags" }
    )
    keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

    vim.cmd("autocmd User TelescopePreviewerLoaded setlocal number")
  end,
}
