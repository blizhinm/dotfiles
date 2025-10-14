local function with_nvim_tree(fn)
  -- vim.cmd("NvimTreeClose")

  if vim.bo.filetype == "NvimTree" then
    vim.cmd("wincmd p") -- or 'wincmd p'
  end

  if type(fn) == "function" then
    fn()
  else
    vim.notify(
      "with_nvimtree_closed: expected a function, got " .. type(fn),
      vim.log.levels.ERROR
    )
  end
end

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
    local tbuiltin = require("telescope.builtin")

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

    keymap.set("n", "<leader>tx", function()
      with_nvim_tree(tbuiltin.resume)
    end, { desc = "Toggle telescope" })

    keymap.set("n", "<leader>tf", function()
      with_nvim_tree(tbuiltin.find_files)
    end, { desc = "Fuzzy find files in cwd" })

    keymap.set("n", "<leader>tF", function()
      with_nvim_tree(function()
        tbuiltin.find_files({
          layout_strategy = "vertical",
          layout_config = {
            width = 0.9,
            height = 0.95,
            preview_height = 0.4,
          },
        })
      end)
    end, { desc = "Fuzzy find files in cwd in vertical mode" })

    keymap.set("n", "<leader>tb", function()
      with_nvim_tree(function()
        tbuiltin.buffers({
          sort_mru = false,
          sort_lastused = false,
          initial_mode = "insert",
          theme = "ivy",
        })
      end)
    end, { desc = "Fuzzy find buffers" })

    keymap.set("n", "<leader>tr", function()
      with_nvim_tree(tbuiltin.oldfiles)
    end, { desc = "Fuzzy find recent files" })

    keymap.set("n", "<leader>ts", function()
      with_nvim_tree(tbuiltin.live_grep)
    end, { desc = "Find string in cwd" })

    keymap.set("n", "<leader>tc", function()
      with_nvim_tree(tbuiltin.grep_string)
    end, { desc = "Find string under cursor in cwd" })

    keymap.set("n", "<leader>th", function()
      with_nvim_tree(tbuiltin.help_tags)
    end, { desc = "Help tags" })

    keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

    vim.cmd("autocmd User TelescopePreviewerLoaded setlocal number")
  end,
}
