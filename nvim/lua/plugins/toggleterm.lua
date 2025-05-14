local screen_util = require("util.screen")

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  lazy = false,
  config = function()
    local sizes = screen_util.get_window_sizes_by_ratios({ w = 0.7, h = 0.9 })

    require("toggleterm").setup({
      shell = vim.o.shell,
      open_mapping = [[<M-\>]],
      hide_numbers = true, -- hide the number column in toggleterm buffers
      autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
      direction = "float",
      size = 15,
      close_on_exit = true, -- close the terminal window when the process exits
      auto_scroll = true, -- automatically scroll to the bottom on terminal output
      float_opts = {
        -- The border key is *almost* the same as 'nvim_open_win'
        -- see :h nvim_open_win for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        border = "curved", -- other options supported by win open
        -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
        width = sizes.width,
        height = sizes.height,
        row = sizes.row,
        col = sizes.col,
        -- winblend = 0,
        -- zindex = <value>,
      },
      highlights = {
        FloatBorder = {
          guifg = "#b4befe",
        },
      },
    })

    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
    end

    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
  end,
}
